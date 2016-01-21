// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLPhotoEntity.h instead.

#import <CoreData/CoreData.h>

extern const struct FHLPhotoEntityAttributes {
	__unsafe_unretained NSString *photoData;
} FHLPhotoEntityAttributes;

extern const struct FHLPhotoEntityRelationships {
	__unsafe_unretained NSString *book;
} FHLPhotoEntityRelationships;

@class FHLBook;

@interface FHLPhotoEntityID : NSManagedObjectID {}
@end

@interface _FHLPhotoEntity : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FHLPhotoEntityID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FHLBook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _FHLPhotoEntity (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (FHLBook*)primitiveBook;
- (void)setPrimitiveBook:(FHLBook*)value;

@end
