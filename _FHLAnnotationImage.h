// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLAnnotationImage.h instead.

#import <CoreData/CoreData.h>

extern const struct FHLAnnotationImageAttributes {
	__unsafe_unretained NSString *imageData;
} FHLAnnotationImageAttributes;

extern const struct FHLAnnotationImageRelationships {
	__unsafe_unretained NSString *annotation;
} FHLAnnotationImageRelationships;

@class FHLAnnotation;

@interface FHLAnnotationImageID : NSManagedObjectID {}
@end

@interface _FHLAnnotationImage : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FHLAnnotationImageID* objectID;

@property (nonatomic, strong) NSData* imageData;

//- (BOOL)validateImageData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FHLAnnotation *annotation;

//- (BOOL)validateAnnotation:(id*)value_ error:(NSError**)error_;

@end

@interface _FHLAnnotationImage (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveImageData;
- (void)setPrimitiveImageData:(NSData*)value;

- (FHLAnnotation*)primitiveAnnotation;
- (void)setPrimitiveAnnotation:(FHLAnnotation*)value;

@end
