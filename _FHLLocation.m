// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLLocation.m instead.

#import "_FHLLocation.h"

const struct FHLLocationAttributes FHLLocationAttributes = {
	.address = @"address",
	.latitude = @"latitude",
	.logitude = @"logitude",
};

const struct FHLLocationRelationships FHLLocationRelationships = {
	.annotations = @"annotations",
	.mapSnapshot = @"mapSnapshot",
};

@implementation FHLLocationID
@end

@implementation _FHLLocation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Location";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Location" inManagedObjectContext:moc_];
}

- (FHLLocationID*)objectID {
	return (FHLLocationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"latitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"logitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"logitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic address;

@dynamic latitude;

- (double)latitudeValue {
	NSNumber *result = [self latitude];
	return [result doubleValue];
}

- (void)setLatitudeValue:(double)value_ {
	[self setLatitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLatitudeValue {
	NSNumber *result = [self primitiveLatitude];
	return [result doubleValue];
}

- (void)setPrimitiveLatitudeValue:(double)value_ {
	[self setPrimitiveLatitude:[NSNumber numberWithDouble:value_]];
}

@dynamic logitude;

- (double)logitudeValue {
	NSNumber *result = [self logitude];
	return [result doubleValue];
}

- (void)setLogitudeValue:(double)value_ {
	[self setLogitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLogitudeValue {
	NSNumber *result = [self primitiveLogitude];
	return [result doubleValue];
}

- (void)setPrimitiveLogitudeValue:(double)value_ {
	[self setPrimitiveLogitude:[NSNumber numberWithDouble:value_]];
}

@dynamic annotations;

- (NSMutableSet*)annotationsSet {
	[self willAccessValueForKey:@"annotations"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"annotations"];

	[self didAccessValueForKey:@"annotations"];
	return result;
}

@dynamic mapSnapshot;

@end

