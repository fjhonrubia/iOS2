// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLAnnotation.m instead.

#import "_FHLAnnotation.h"

const struct FHLAnnotationAttributes FHLAnnotationAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.text = @"text",
	.title = @"title",
};

const struct FHLAnnotationRelationships FHLAnnotationRelationships = {
	.book = @"book",
	.image = @"image",
	.location = @"location",
};

@implementation FHLAnnotationID
@end

@implementation _FHLAnnotation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Annotation" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Annotation";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Annotation" inManagedObjectContext:moc_];
}

- (FHLAnnotationID*)objectID {
	return (FHLAnnotationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic text;

@dynamic title;

@dynamic book;

@dynamic image;

@dynamic location;

@end

