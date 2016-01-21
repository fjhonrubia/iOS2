// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLPhotoEntity.m instead.

#import "_FHLPhotoEntity.h"

const struct FHLPhotoEntityAttributes FHLPhotoEntityAttributes = {
	.photoData = @"photoData",
};

const struct FHLPhotoEntityRelationships FHLPhotoEntityRelationships = {
	.book = @"book",
};

@implementation FHLPhotoEntityID
@end

@implementation _FHLPhotoEntity

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PhotoEntity" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PhotoEntity";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PhotoEntity" inManagedObjectContext:moc_];
}

- (FHLPhotoEntityID*)objectID {
	return (FHLPhotoEntityID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic book;

@end

