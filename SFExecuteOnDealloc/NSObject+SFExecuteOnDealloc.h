//
//  NSObject+SFExecuteOnDealloc.h
//  SampleProject
//
//  Created by Krzysztof Zabłocki on 2/28/12.
//  Copyright (c) 2012 Krzysztof Zabłocki. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SF_EXECUTE_ON_DEALLOC_USE_SHORTHAND 1

@interface NSObject (SFExecuteOnDealloc)
#if SF_EXECUTE_ON_DEALLOC_USE_SHORTHAND
- (void)performBlockOnDealloc:(void(^)(void))aBlock;
#else
- (void)sf_performBlockOnDealloc:(void(^)(void))aBlock;
#endif
@end
