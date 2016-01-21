// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLPDFEntity.h instead.

#import <CoreData/CoreData.h>

extern const struct FHLPDFEntityAttributes {
	__unsafe_unretained NSString *pdfData;
} FHLPDFEntityAttributes;

extern const struct FHLPDFEntityRelationships {
	__unsafe_unretained NSString *book;
} FHLPDFEntityRelationships;

@class FHLBook;

@interface FHLPDFEntityID : NSManagedObjectID {}
@end

@interface _FHLPDFEntity : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FHLPDFEntityID* objectID;

@property (nonatomic, strong) NSData* pdfData;

//- (BOOL)validatePdfData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FHLBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _FHLPDFEntity (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePdfData;
- (void)setPrimitivePdfData:(NSData*)value;

- (FHLBook*)primitiveBook;
- (void)setPrimitiveBook:(FHLBook*)value;

@end
