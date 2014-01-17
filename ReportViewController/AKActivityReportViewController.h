//
//  AKActivityReportViewController.h
//  农化通
//
//  Created by 凯_SKK on 13-3-11.
//  Copyright (c) 2013年 山东乐世安通通信技术有限公司. All rights reserved.
// 
//活动上报
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AKCurrentRequest.h"
#import "AKUserData.h"
#import "AKUploadMum.h"
#import "AKCustomerChoiceViewController.h"
@protocol ActivityReportDelegate <NSObject>
@optional

-(void)activityReportSucceedPopWillRefresh;
@end
@interface AKActivityReportViewController : UIViewController<currentRefreshDelegate,CustomerChoiceDelegate,UITextFieldDelegate,UITextViewDelegate>
{
    AKUserData *userData;
    NSMutableDictionary *reportParameterDic;
    AKCurrentRequest *currentRequest;
    AKUploadMum *mum;
}
@property (retain, nonatomic) IBOutlet UITextField *textField1;
@property (retain, nonatomic) IBOutlet UITextField *textField2;
@property (retain, nonatomic) IBOutlet UITextField *textField3;
@property (retain, nonatomic) IBOutlet UITextView *textView1;
@property (assign, nonatomic) id<ActivityReportDelegate>delegate;
@end
