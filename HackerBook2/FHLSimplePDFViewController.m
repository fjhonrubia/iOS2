//
//  FHLSimplePDFViewController.m
//  HackerBook2
//
//  Created by javi on 16/1/16.
//  Copyright © 2016 javi. All rights reserved.
//

#import "FHLSimplePDFViewController.h"
#import "FHLBook.h"
#import "FHLPDFEntity.h"

@interface FHLSimplePDFViewController ()

@property (strong, nonatomic) FHLBook *book;

@end

@implementation FHLSimplePDFViewController

#pragma mark - Init
-(id) initWithBook:(FHLBook *)book {
    
    if (self = [self init]) {
        _book = book;
    }
    return self;
    
}

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    //descarga asíncrona del pdf
    if (self.book.pdf == nil) {
        dispatch_queue_t downloadPdf = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        dispatch_async(downloadPdf, ^{
            NSURL *url = [NSURL URLWithString:self.book.pdfURL];
            NSData *pdf = [NSData dataWithContentsOfURL:url];
            
            dispatch_async(dispatch_get_main_queue(), ^{
    
                [self.pdfView loadData:pdf
                              MIMEType:@"application/pdf"
                      textEncodingName:@"utf-8"
                               baseURL:nil];
                
                FHLPDFEntity *pdfEntity = [FHLPDFEntity pdfWithData:pdf
                                                            context:self.book.managedObjectContext];
                
                self.book.pdf = pdfEntity;
                
            });
        });
    } else {
        [self.pdfView loadData:self.book.pdf.pdfData
                      MIMEType:@"application/pdf"
              textEncodingName:@"utf-8"
                       baseURL:nil];
    }

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"PDF";

}

@end
