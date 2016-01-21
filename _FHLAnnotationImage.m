// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLAnnotationImage.m instead.

#import "_FHLAnnotationImage.h"

const struct FHLAnnotationImageAttributes FHLAnnotationImageAttributes = {
	.imageData = @"imageData",
};

const struct FHLAnnotationImageRelationships FHLAnnotationImageRelationships = {
	.annotation = @"annotation",
};

@implementation FHLAnnotationImageID
@end

@implementation _FHLAnnotationImage

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"AnnotationImage" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"AnnotationImage";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"AnnotationImage" inManagedObjectContext:moc_];
}

- (FHLAnnotationImageID*)objectID {
	return (FHLAnnotationImageID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic imageData;

@dynamic annotation;

@end

