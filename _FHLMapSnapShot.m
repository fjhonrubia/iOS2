// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLMapSnapShot.m instead.

#import "_FHLMapSnapShot.h"

const struct FHLMapSnapShotAttributes FHLMapSnapShotAttributes = {
	.snapshotData = @"snapshotData",
};

const struct FHLMapSnapShotRelationships FHLMapSnapShotRelationships = {
	.location = @"location",
};

@implementation FHLMapSnapShotID
@end

@implementation _FHLMapSnapShot

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MapSnapshot" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MapSnapshot";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MapSnapshot" inManagedObjectContext:moc_];
}

- (FHLMapSnapShotID*)objectID {
	return (FHLMapSnapShotID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic snapshotData;

@dynamic location;

@end

