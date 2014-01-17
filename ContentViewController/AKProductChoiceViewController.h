//
//  AKProductChoiceViewController.h
//  农化通
//
//  Created by 凯_SKK on 13-3-12.
//  Copyright (c) 2013年 山东乐世安通通信技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKUploadMum.h"
#import "AKUserData.h"
#import "AKCurrentRequest.h"
@protocol ProductChoiceDelegate <NSObject>
@optional

-(void)productChoiceSucceedPopWithDictionary:(NSDictionary*)aDic;
@end
@interface AKProductChoiceViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,currentRefreshDelegate>
{
    UITableView *aTableView;
    AKUploadMum *mum;
    AKCurrentRequest *currentRequestContent;
    AKUserData *userData;
    NSMutableArray *cellViewArray;
    NSMutableString *pagecountStr;
    NSMutableString *currentPageStr;
    NSMutableDictionary *parameterDic;//参数Dic
    NSMutableArray *cellArray;
    NSMutableDictionary *popDic;
    UIView *queryView;
    UITextField *queryTextField1;
    UITextField *queryTextField2;
    UITextField *queryTextField3;
    UITextField *queryTextField4;
    UIView *selectView;
    UITextField *selectTextField1;
    UITextField *selectTextField2;
}
@property (assign, nonatomic) id<ProductChoiceDelegate> delegate;
@end
