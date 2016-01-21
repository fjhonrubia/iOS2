// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLAuthor.m instead.

#import "_FHLAuthor.h"

const struct FHLAuthorAttributes FHLAuthorAttributes = {
	.name = @"name",
};

const struct FHLAuthorRelationships FHLAuthorRelationships = {
	.books = @"books",
};

@implementation FHLAuthorID
@end

@implementation _FHLAuthor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Author";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Author" inManagedObjectContext:moc_];
}

- (FHLAuthorID*)objectID {
	return (FHLAuthorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic books;

- (NSMutableSet*)booksSet {
	[self willAccessValueForKey:@"books"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"books"];

	[self didAccessValueForKey:@"books"];
	return result;
}

@end

