//
//  FHLSimplePDFViewController.h
//  HackerBook2
//
//  Created by javi on 16/1/16.
//  Copyright © 2016 javi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FHLBook;

@interface FHLSimplePDFViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *pdfView;

-(id) initWithBook:(FHLBook *)book;
@end
