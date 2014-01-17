//
//  AKIndentRecordContentViewController.h
//  农化通
//
//  Created by 凯_SKK on 13-3-4.
//  Copyright (c) 2013年 山东乐世安通通信技术有限公司. All rights reserved.
//
//订单记录
#import <UIKit/UIKit.h>
#import "AKUploadMum.h"
#import "AKUserData.h"
#import "AKCurrentRequest.h"
#import "AKCurrentQueryViewController.h"
#import "AKIndentReportViewController.h"
@interface AKIndentRecordContentViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,currentRefreshDelegate,currentQueryDelegate,IndentReportDelegate>
{
    UITableView *aTableView;
    AKUploadMum *mum;
    AKCurrentRequest *currentRequestContent;
    AKUserData *userData;
    NSMutableArray *cellViewArray;
    NSMutableString *pagecountStr;
    NSMutableString *currentPageStr;
    NSMutableDictionary *parameterDic;//参数Dic
}

@end
