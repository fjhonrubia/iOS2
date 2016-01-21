// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FHLAuthor.h instead.

#import <CoreData/CoreData.h>

extern const struct FHLAuthorAttributes {
	__unsafe_unretained NSString *name;
} FHLAuthorAttributes;

extern const struct FHLAuthorRelationships {
	__unsafe_unretained NSString *books;
} FHLAuthorRelationships;

@class FHLBook;

@interface FHLAuthorID : NSManagedObjectID {}
@end

@interface _FHLAuthor : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FHLAuthorID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *books;

- (NSMutableSet*)booksSet;

@end

@interface _FHLAuthor (BooksCoreDataGeneratedAccessors)
- (void)addBooks:(NSSet*)value_;
- (void)removeBooks:(NSSet*)value_;
- (void)addBooksObject:(FHLBook*)value_;
- (void)removeBooksObject:(FHLBook*)value_;

@end

@interface _FHLAuthor (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveBooks;
- (void)setPrimitiveBooks:(NSMutableSet*)value;

@end
