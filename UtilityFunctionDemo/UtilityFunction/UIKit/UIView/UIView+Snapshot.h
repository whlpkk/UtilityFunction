//
//  UIView+Snapshot.h
//  s
//
//  Created by yzk on 15/6/18.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Snapshot)

/**
 *  view快照
 *
 *  @param opaque 是否不透明，YES: 表示快照得到的image不透明，如果快照的view背景色为clear(即透明色)，则image会黑屏。其他正常
     NO: 表示快照得到的image透明，如果快照的view背景色为clear(即透明色)，则image会类似png图片。其他正常
 *
 *  @return 快照的image
 */
- (UIImage *)viewSnapshot;
- (UIImage *)viewSnapshotWithOpaque:(BOOL)opaque;

@end
