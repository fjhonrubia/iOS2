// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLBook.h instead.

#import <CoreData/CoreData.h>

extern const struct FHLBookAttributes {
	__unsafe_unretained NSString *isFavorite;
	__unsafe_unretained NSString *isFinished;
	__unsafe_unretained NSString *lastPage;
	__unsafe_unretained NSString *pdfURL;
	__unsafe_unretained NSString *photoURL;
	__unsafe_unretained NSString *title;
} FHLBookAttributes;

extern const struct FHLBookRelationships {
	__unsafe_unretained NSString *annotations;
	__unsafe_unretained NSString *authors;
	__unsafe_unretained NSString *pdf;
	__unsafe_unretained NSString *photo;
	__unsafe_unretained NSString *tags;
} FHLBookRelationships;

@class FHLAnnotation;
@class FHLAuthor;
@class FHLPDFEntity;
@class FHLPhotoEntity;
@class FHLTag;

@interface FHLBookID : NSManagedObjectID {}
@end

@interface _FHLBook : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FHLBookID* objectID;

@property (nonatomic, strong) NSNumber* isFavorite;

@property (atomic) BOOL isFavoriteValue;
- (BOOL)isFavoriteValue;
- (void)setIsFavoriteValue:(BOOL)value_;

//- (BOOL)validateIsFavorite:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* isFinished;

@property (atomic) BOOL isFinishedValue;
- (BOOL)isFinishedValue;
- (void)setIsFinishedValue:(BOOL)value_;

//- (BOOL)validateIsFinished:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* lastPage;

@property (atomic) int16_t lastPageValue;
- (int16_t)lastPageValue;
- (void)setLastPageValue:(int16_t)value_;

//- (BOOL)validateLastPage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* pdfURL;

//- (BOOL)validatePdfURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* photoURL;

//- (BOOL)validatePhotoURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *annotations;

- (NSMutableSet*)annotationsSet;

@property (nonatomic, strong) NSSet *authors;

- (NSMutableSet*)authorsSet;

@property (nonatomic, strong) FHLPDFEntity *pdf;

//- (BOOL)validatePdf:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FHLPhotoEntity *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *tags;

- (NSMutableSet*)tagsSet;

@end

@interface _FHLBook (AnnotationsCoreDataGeneratedAccessors)
- (void)addAnnotations:(NSSet*)value_;
- (void)removeAnnotations:(NSSet*)value_;
- (void)addAnnotationsObject:(FHLAnnotation*)value_;
- (void)removeAnnotationsObject:(FHLAnnotation*)value_;

@end

@interface _FHLBook (AuthorsCoreDataGeneratedAccessors)
- (void)addAuthors:(NSSet*)value_;
- (void)removeAuthors:(NSSet*)value_;
- (void)addAuthorsObject:(FHLAuthor*)value_;
- (void)removeAuthorsObject:(FHLAuthor*)value_;

@end

@interface _FHLBook (TagsCoreDataGeneratedAccessors)
- (void)addTags:(NSSet*)value_;
- (void)removeTags:(NSSet*)value_;
- (void)addTagsObject:(FHLTag*)value_;
- (void)removeTagsObject:(FHLTag*)value_;

@end

@interface _FHLBook (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveIsFavorite;
- (void)setPrimitiveIsFavorite:(NSNumber*)value;

- (BOOL)primitiveIsFavoriteValue;
- (void)setPrimitiveIsFavoriteValue:(BOOL)value_;

- (NSNumber*)primitiveIsFinished;
- (void)setPrimitiveIsFinished:(NSNumber*)value;

- (BOOL)primitiveIsFinishedValue;
- (void)setPrimitiveIsFinishedValue:(BOOL)value_;

- (NSNumber*)primitiveLastPage;
- (void)setPrimitiveLastPage:(NSNumber*)value;

- (int16_t)primitiveLastPageValue;
- (void)setPrimitiveLastPageValue:(int16_t)value_;

- (NSString*)primitivePdfURL;
- (void)setPrimitivePdfURL:(NSString*)value;

- (NSString*)primitivePhotoURL;
- (void)setPrimitivePhotoURL:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (NSMutableSet*)primitiveAnnotations;
- (void)setPrimitiveAnnotations:(NSMutableSet*)value;

- (NSMutableSet*)primitiveAuthors;
- (void)setPrimitiveAuthors:(NSMutableSet*)value;

- (FHLPDFEntity*)primitivePdf;
- (void)setPrimitivePdf:(FHLPDFEntity*)value;

- (FHLPhotoEntity*)primitivePhoto;
- (void)setPrimitivePhoto:(FHLPhotoEntity*)value;

- (NSMutableSet*)primitiveTags;
- (void)setPrimitiveTags:(NSMutableSet*)value;

@end
