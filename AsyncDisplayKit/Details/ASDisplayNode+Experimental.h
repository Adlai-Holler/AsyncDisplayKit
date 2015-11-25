/* Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ASDisplayNode (Experimental)

/**
 Perform the provided block while respecting the node's thread affinity.

 @param block The work to perform.

 @discussion After a node's view or layer is loaded, some properties may only
 be accessed on the main thread. All properties bridged from UIView or CALayer
 have this restriction.
 
 If the receiver's view/layer is already loaded, the block will be executed
 asynchronously on the main thread. Otherwise it will be executed synchronously
 on the calling thread.
 */
- (void)performBlock:(void (^)())block;

@end
