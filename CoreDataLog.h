//
//  CoreDataLog.h
//  Created by Mark Jones on 9/24/09.
//  Copyright 2009 Geordie Enterprises LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataLog : NSObject {
  NSManagedObjectContext *managedObjectContext;
  BOOL shouldShowData;
  BOOL shouldShowProps;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, assign) BOOL shouldShowData;
@property (nonatomic, assign) BOOL shouldShowProps;

- (id) init:(NSManagedObjectContext*)context andShowProps:(BOOL)showProps andShowData:(BOOL)showData;
- (void) show;
- (void) showProperties:(NSArray*)properties;
- (void) shouldShowData:(NSArray*)properties andData:(NSArray*)data;

@end
