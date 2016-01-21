// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLMapSnapShot.h instead.

#import <CoreData/CoreData.h>

extern const struct FHLMapSnapShotAttributes {
	__unsafe_unretained NSString *snapshotData;
} FHLMapSnapShotAttributes;

extern const struct FHLMapSnapShotRelationships {
	__unsafe_unretained NSString *location;
} FHLMapSnapShotRelationships;

@class FHLLocation;

@interface FHLMapSnapShotID : NSManagedObjectID {}
@end

@interface _FHLMapSnapShot : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FHLMapSnapShotID* objectID;

@property (nonatomic, strong) NSData* snapshotData;

//- (BOOL)validateSnapshotData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FHLLocation *location;

//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;

@end

@interface _FHLMapSnapShot (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveSnapshotData;
- (void)setPrimitiveSnapshotData:(NSData*)value;

- (FHLLocation*)primitiveLocation;
- (void)setPrimitiveLocation:(FHLLocation*)value;

@end
