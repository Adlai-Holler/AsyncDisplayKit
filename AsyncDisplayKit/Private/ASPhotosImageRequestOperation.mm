/* Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "ASPhotosImageRequestOperation.h"
#import "ASBaseDefines.h"
#import <Photos/Photos.h>
#import <AsyncDisplayKit/ASThread.h>

@interface ASPhotosImageRequestOperation()
@property (nonatomic) PHImageRequestID phRequestID;
@end

@implementation ASPhotosImageRequestOperation {
  ASDN::Mutex _propertiesLock;
}

- (instancetype)init
{
  ASDISPLAYNODE_NOT_DESIGNATED_INITIALIZER();
  return [self initWithRequest:nil imageManager:nil];
}

- (instancetype)initWithRequest:(ASPhotosFrameworkImageRequest *)request imageManager:(PHImageManager *)imageManager
{
  self = [super init];
  if (self) {
    _request = request;
    _phRequestID = PHInvalidImageRequestID;
    _imageManager = imageManager ?: PHImageManager.defaultManager;
  }
  return self;
}

- (void)main
{

}

- (void)cancel
{
  [super cancel];
  ASDN::MutexLocker l(_propertiesLock);
  PHImageRequestID requestID = _phRequestID;
  if (requestID != PHInvalidImageRequestID) {
    [_imageManager cancelImageRequest:requestID];
  }
}

@end
