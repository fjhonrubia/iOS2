// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLPDFEntity.m instead.

#import "_FHLPDFEntity.h"

const struct FHLPDFEntityAttributes FHLPDFEntityAttributes = {
	.pdfData = @"pdfData",
};

const struct FHLPDFEntityRelationships FHLPDFEntityRelationships = {
	.book = @"book",
};

@implementation FHLPDFEntityID
@end

@implementation _FHLPDFEntity

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PDFEntity" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PDFEntity";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PDFEntity" inManagedObjectContext:moc_];
}

- (FHLPDFEntityID*)objectID {
	return (FHLPDFEntityID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic pdfData;

@dynamic book;

@end

