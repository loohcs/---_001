//
//  AKIndentReportViewController.h
//  农化通
//
//  Created by 凯_SKK on 13-3-12.
//  Copyright (c) 2013年 山东乐世安通通信技术有限公司. All rights reserved.
//
//订单、退货、样品上报
#import <UIKit/UIKit.h>
#import "AKCurrentRequest.h"
#import "AKUserData.h"
#import "AKUploadMum.h"
#import "AKCustomerChoiceViewController.h"
#import "AKProductChoiceViewController.h"
@protocol IndentReportDelegate <NSObject>
@optional

-(void)indentReportSucceedPopWillRefresh;
@end
@interface AKIndentReportViewController : UIViewController<UIAlertViewDelegate,currentRefreshDelegate,CustomerChoiceDelegate,ProductChoiceDelegate,UITextFieldDelegate>
{
    AKUserData *userData;
    NSMutableDictionary *reportParameterDic;
    NSMutableArray *cellArray;
    NSMutableArray *cellViewArray;
    AKCurrentRequest *currentRequest;
    AKUploadMum *mum;
    NSInteger buttonTag;
}
@property (retain, nonatomic) IBOutlet UITextField *textField1;
@property (retain, nonatomic) IBOutlet UITextField *textField2;
@property (retain, nonatomic) IBOutlet UITextField *textField3;
@property (retain, nonatomic) IBOutlet UITableView *aTableView;
@property (assign, nonatomic) id<IndentReportDelegate>delegate;
@property (retain, nonatomic) NSString *reportName;
@property (assign, nonatomic) NSInteger reportTag;
@end
