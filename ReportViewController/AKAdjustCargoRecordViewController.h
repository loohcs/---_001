//
//  AKAdjustCargoRecordViewController.h
//  农化通
//
//  Created by 凯_SKK on 13-3-13.
//  Copyright (c) 2013年 山东乐世安通通信技术有限公司. All rights reserved.
//
//调货上报
#import <UIKit/UIKit.h>
#import "AKCurrentRequest.h"
#import "AKUserData.h"
#import "AKUploadMum.h"
#import "AKCustomerChoiceViewController.h"
#import "AKAdjustCargoProductChoiceViewController.h"
@protocol adjustCargoReportDelegate <NSObject>
@optional

-(void)adjustCargoReportSucceedPopWillRefresh;
@end
@interface AKAdjustCargoRecordViewController : UIViewController<UIAlertViewDelegate,currentRefreshDelegate,CustomerChoiceDelegate,AdjustCargoProductChoiceDelegate,UITextFieldDelegate>
{
    AKUserData *userData;
    NSMutableDictionary *reportParameterDic;
    NSMutableArray *cellArray;
    NSMutableArray *cellViewArray;
    AKCurrentRequest *currentRequest;
    AKUploadMum *mum;
    NSInteger buttonTag;
    BOOL isOutCustomer;
}
@property (retain, nonatomic) IBOutlet UITextField *textField1;
@property (retain, nonatomic) IBOutlet UITextField *textField2;
@property (retain, nonatomic) IBOutlet UITextField *textField3;
@property (retain, nonatomic) IBOutlet UITextField *textField4;
@property (retain, nonatomic) IBOutlet UITableView *aTableView;
@property (assign, nonatomic) id<adjustCargoReportDelegate> delegate;
@end
