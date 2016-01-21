// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLTag.h instead.

#import <CoreData/CoreData.h>

extern const struct FHLTagAttributes {
	__unsafe_unretained NSString *name;
} FHLTagAttributes;

extern const struct FHLTagRelationships {
	__unsafe_unretained NSString *books;
} FHLTagRelationships;

@class FHLBook;

@interface FHLTagID : NSManagedObjectID {}
@end

@interface _FHLTag : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FHLTagID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *books;

- (NSMutableSet*)booksSet;

@end

@interface _FHLTag (BooksCoreDataGeneratedAccessors)
- (void)addBooks:(NSSet*)value_;
- (void)removeBooks:(NSSet*)value_;
- (void)addBooksObject:(FHLBook*)value_;
- (void)removeBooksObject:(FHLBook*)value_;

@end

@interface _FHLTag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveBooks;
- (void)setPrimitiveBooks:(NSMutableSet*)value;

@end
