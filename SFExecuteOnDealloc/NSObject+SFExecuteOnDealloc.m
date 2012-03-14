//
//  NSObject+SFExecuteOnDealloc.m
//  SampleProject
//
//  Created by Krzysztof Zabłocki on 2/28/12.
//  Copyright (c) 2012 Krzysztof Zabłocki. All rights reserved.
//
#import <objc/runtime.h>
#import "NSObject+SFExecuteOnDealloc.h"

@interface SFExecuteOnDeallocInternalObject : NSObject
- (id)initWithBlock:(void(^)(void))aBlock;
@end

@implementation SFExecuteOnDeallocInternalObject {
  void(^block)(void);
}

- (id)initWithBlock:(void(^)(void))aBlock
{
  self = [super init];
  if (self) {
    block = [aBlock copy];
  }
  return self;
}

- (void)dealloc
{
  if (block) {
    block();
    [block release];
  }
  [super dealloc];
}
@end

@implementation NSObject (SFExecuteOnDealloc)
#if SF_EXECUTE_ON_DEALLOC_USE_SHORTHAND
- (void)performBlockOnDealloc:(void(^)(void))aBlock
#else
- (void)sf_performBlockOnDealloc:(void(^)(void))aBlock
#endif
{
  //! we need some object that will be deallocated with this one, and since we are only assigning and never again needing access to this object, let use its memory adress as key
  SFExecuteOnDeallocInternalObject *internalObject = [[SFExecuteOnDeallocInternalObject alloc] initWithBlock:aBlock];
  objc_setAssociatedObject(self, internalObject, internalObject, OBJC_ASSOCIATION_RETAIN);
  [internalObject release];
}

@end
