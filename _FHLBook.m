// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLBook.m instead.

#import "_FHLBook.h"

const struct FHLBookAttributes FHLBookAttributes = {
	.isFavorite = @"isFavorite",
	.isFinished = @"isFinished",
	.lastPage = @"lastPage",
	.pdfURL = @"pdfURL",
	.photoURL = @"photoURL",
	.title = @"title",
};

const struct FHLBookRelationships FHLBookRelationships = {
	.annotations = @"annotations",
	.authors = @"authors",
	.pdf = @"pdf",
	.photo = @"photo",
	.tags = @"tags",
};

@implementation FHLBookID
@end

@implementation _FHLBook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Book";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Book" inManagedObjectContext:moc_];
}

- (FHLBookID*)objectID {
	return (FHLBookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"isFavoriteValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isFavorite"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"isFinishedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isFinished"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"lastPageValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lastPage"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic isFavorite;

- (BOOL)isFavoriteValue {
	NSNumber *result = [self isFavorite];
	return [result boolValue];
}

- (void)setIsFavoriteValue:(BOOL)value_ {
	[self setIsFavorite:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsFavoriteValue {
	NSNumber *result = [self primitiveIsFavorite];
	return [result boolValue];
}

- (void)setPrimitiveIsFavoriteValue:(BOOL)value_ {
	[self setPrimitiveIsFavorite:[NSNumber numberWithBool:value_]];
}

@dynamic isFinished;

- (BOOL)isFinishedValue {
	NSNumber *result = [self isFinished];
	return [result boolValue];
}

- (void)setIsFinishedValue:(BOOL)value_ {
	[self setIsFinished:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsFinishedValue {
	NSNumber *result = [self primitiveIsFinished];
	return [result boolValue];
}

- (void)setPrimitiveIsFinishedValue:(BOOL)value_ {
	[self setPrimitiveIsFinished:[NSNumber numberWithBool:value_]];
}

@dynamic lastPage;

- (int16_t)lastPageValue {
	NSNumber *result = [self lastPage];
	return [result shortValue];
}

- (void)setLastPageValue:(int16_t)value_ {
	[self setLastPage:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveLastPageValue {
	NSNumber *result = [self primitiveLastPage];
	return [result shortValue];
}

- (void)setPrimitiveLastPageValue:(int16_t)value_ {
	[self setPrimitiveLastPage:[NSNumber numberWithShort:value_]];
}

@dynamic pdfURL;

@dynamic photoURL;

@dynamic title;

@dynamic annotations;

- (NSMutableSet*)annotationsSet {
	[self willAccessValueForKey:@"annotations"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"annotations"];

	[self didAccessValueForKey:@"annotations"];
	return result;
}

@dynamic authors;

- (NSMutableSet*)authorsSet {
	[self willAccessValueForKey:@"authors"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"authors"];

	[self didAccessValueForKey:@"authors"];
	return result;
}

@dynamic pdf;

@dynamic photo;

@dynamic tags;

- (NSMutableSet*)tagsSet {
	[self willAccessValueForKey:@"tags"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"tags"];

	[self didAccessValueForKey:@"tags"];
	return result;
}

@end

