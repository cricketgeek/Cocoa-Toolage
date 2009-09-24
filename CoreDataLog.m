//
//  CoreDataLog.m
//  Created by Mark Jones on 9/24/09.
//  Copyright 2009 Geordie Enterprises LLC. All rights reserved.
//

#import "CoreDataLog.h"

@implementation CoreDataLog

@synthesize managedObjectContext, shouldShowData, shouldShowProps;

- (id) init:(NSManagedObjectContext*)context andShowProps:(BOOL)showProps andShowData:(BOOL)showData
{
  self = [super init];
  if (self != nil) {
    
    self.managedObjectContext = context;
    self.shouldShowData = showData;
    self.shouldShowProps = showProps;
    
  }
  return self;
}

- (void) show {
  
  NSError* aError;
  NSEntityDescription* entity;
  NSFetchRequest* fq;
  NSArray* data;
  
  NSLog(@"******************************************");
  NSLog(@"********** Core Data Contents ************\n");

  NSArray* entities = [[[[self managedObjectContext] persistentStoreCoordinator] managedObjectModel] entities];
  for (NSEntityDescription* desc in entities) {
    NSLog(@"********* Entity Named: %@  ************", [desc name]);
    
    fq = [[NSFetchRequest alloc] init];
    entity = [NSEntityDescription entityForName:[desc name] inManagedObjectContext:self.managedObjectContext];
    [fq setEntity:entity];
    data = [self.managedObjectContext executeFetchRequest:fq error:&aError];
   
    if (self.shouldShowProps) {
      [self showProperties:[desc properties]];
    }
    
    if(data != nil) {
      [self shouldShowData:[desc properties] andData:data];      
    }
    
    NSLog(@"******************************************\n");
  }
  NSLog(@"******************************************\n");
}

- (void) showProperties:(NSArray*)properties {

  NSLog(@"************** Properties ********************\n");
  for (NSPropertyDescription* prop in properties) {
    NSLog(@"prop name: %@", [prop name]);
    if ([prop isKindOfClass:[NSRelationshipDescription class]]) {
      NSLog(@"Class type for this prop is %@",[[(NSRelationshipDescription*)prop destinationEntity] name]);
    }
  }
}

- (void) shouldShowData:(NSArray*)properties andData:(NSArray*)data {
  
  NSLog(@"************** Data ********************\n");
  NSLog(@"found %d records",[data count]);
  for (NSManagedObject* object in data) {
    for (NSPropertyDescription* prop in properties) {
      if ([prop isKindOfClass:[NSAttributeDescription class]]) {
        NSString* methodName = [prop name];
        NSLog(@"%@ : %@",[prop name],[object performSelector:NSSelectorFromString(methodName)]);
      }
    }
    NSLog(@"\n");
  }
  
}


@end
