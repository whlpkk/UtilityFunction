//
//  ScanQRCodeViewController.h
//  s
//
//  Created by yzk on 15/6/26.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ScanQRCodeViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>
{
    int _num;
    BOOL _upOrdown;
    NSTimer *_timer;
}
@property (strong, nonatomic) AVCaptureDevice *device;
@property (strong, nonatomic) AVCaptureDeviceInput *input;
@property (strong, nonatomic) AVCaptureMetadataOutput *output;
@property (strong, nonatomic) AVCaptureSession *session;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *preview;
@property (nonatomic, retain) UIImageView *line;

@end
