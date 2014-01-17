//
//  AKDailyRecordContentViewController.h
//  农化通
//
//  Created by 凯_SKK on 13-3-4.
//  Copyright (c) 2013年 山东乐世安通通信技术有限公司. All rights reserved.
//
//日报上报
#import <UIKit/UIKit.h>
#import "AKUploadMum.h"
#import "AKUserData.h"
#import "AKCurrentRequest.h" 
#import "AKDailyReportViewController.h"
@interface AKDailyRecordContentViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,currentRefreshDelegate,dailyReportDelegate>
{
    UITableView *aTableView;
    AKUploadMum *mum;
    AKCurrentRequest *currentRequestContent;
    AKUserData *userData;
    NSMutableArray *cellViewArray;
    NSMutableString *pagecountStr;
    NSMutableString *currentPageStr;
    NSMutableDictionary *parameterDic;//参数Dic
    UIView *queryView;
    UITextField *queryTextField1;
    UITextField *queryTextField2;
    UITextField *queryTextField3;
    UITextField *queryTextField4;
}

@end
