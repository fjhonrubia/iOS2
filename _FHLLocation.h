// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLLocation.h instead.

#import <CoreData/CoreData.h>

extern const struct FHLLocationAttributes {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *logitude;
} FHLLocationAttributes;

extern const struct FHLLocationRelationships {
	__unsafe_unretained NSString *annotations;
	__unsafe_unretained NSString *mapSnapshot;
} FHLLocationRelationships;

@class FHLAnnotation;
@class FHLMapSnapShot;

@interface FHLLocationID : NSManagedObjectID {}
@end

@interface _FHLLocation : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FHLLocationID* objectID;

@property (nonatomic, strong) NSString* address;

//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* latitude;

@property (atomic) double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* logitude;

@property (atomic) double logitudeValue;
- (double)logitudeValue;
- (void)setLogitudeValue:(double)value_;

//- (BOOL)validateLogitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *annotations;

- (NSMutableSet*)annotationsSet;

@property (nonatomic, strong) FHLMapSnapShot *mapSnapshot;

//- (BOOL)validateMapSnapshot:(id*)value_ error:(NSError**)error_;

@end

@interface _FHLLocation (AnnotationsCoreDataGeneratedAccessors)
- (void)addAnnotations:(NSSet*)value_;
- (void)removeAnnotations:(NSSet*)value_;
- (void)addAnnotationsObject:(FHLAnnotation*)value_;
- (void)removeAnnotationsObject:(FHLAnnotation*)value_;

@end

@interface _FHLLocation (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;

- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;

- (NSNumber*)primitiveLogitude;
- (void)setPrimitiveLogitude:(NSNumber*)value;

- (double)primitiveLogitudeValue;
- (void)setPrimitiveLogitudeValue:(double)value_;

- (NSMutableSet*)primitiveAnnotations;
- (void)setPrimitiveAnnotations:(NSMutableSet*)value;

- (FHLMapSnapShot*)primitiveMapSnapshot;
- (void)setPrimitiveMapSnapshot:(FHLMapSnapShot*)value;

@end
