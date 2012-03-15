Purpose
--------------

SFExecuteOnDealloc is a simple category on NSObject that allows you to execute arbitrary blocks when object gets dealloced. Keep in mind that order of execution is random when you add multiple blocks.

Supported OS & SDK Versions
-----------------------------

* iOS 4.0 (Xcode 4.3, Apple LLVM compiler 3.1)

ARC Compatibility
------------------

Actually version doesn't use ARC, but if you would like it just add an issue on GitHub and I will add it.

Installation
--------------

To use the NSObject+SFExecuteOnDealloc category in an app, just drag the category files (demo files and assets are not needed) into your project.
Preferably include NSObject+SFExecuteOnDealloc.h in your Prefix.pch file. 

Methods
--------------

    - (void)performBlockOnDealloc:(void(^)(void))aBlock;
Will call selected block when an object is deallocated.

Sample use
--------------

    __block NSObject *weakSelf = someTestObject;
    [someTestObject performBlockOnDealloc:^{
      NSLog(@"this is block for object %@", weakSelf);
    }];
