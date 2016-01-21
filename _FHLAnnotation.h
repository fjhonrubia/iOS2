// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLAnnotation.h instead.

#import <CoreData/CoreData.h>

extern const struct FHLAnnotationAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *text;
	__unsafe_unretained NSString *title;
} FHLAnnotationAttributes;

extern const struct FHLAnnotationRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *image;
	__unsafe_unretained NSString *location;
} FHLAnnotationRelationships;

@class FHLBook;
@class FHLAnnotationImage;
@class FHLLocation;

@interface FHLAnnotationID : NSManagedObjectID {}
@end

@interface _FHLAnnotation : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FHLAnnotationID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FHLBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FHLAnnotationImage *image;

//- (BOOL)validateImage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FHLLocation *location;

//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;

@end

@interface _FHLAnnotation (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (FHLBook*)primitiveBook;
- (void)setPrimitiveBook:(FHLBook*)value;

- (FHLAnnotationImage*)primitiveImage;
- (void)setPrimitiveImage:(FHLAnnotationImage*)value;

- (FHLLocation*)primitiveLocation;
- (void)setPrimitiveLocation:(FHLLocation*)value;

@end
