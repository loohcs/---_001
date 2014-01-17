//
//  AKCurrentQueryViewController.h
//  农化通
//
//  Created by 凯_SKK on 13-3-7.
//  Copyright (c) 2013年 山东乐世安通通信技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol currentQueryDelegate <NSObject>
@optional

-(void)currentQueryPopWithContentDictionary:(NSDictionary*)aContentDic;
@end
@interface AKCurrentQueryViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *textField1;
@property (retain, nonatomic) IBOutlet UITextField *textField2;
@property (retain, nonatomic) IBOutlet UITextField *textField3;
@property (retain, nonatomic) IBOutlet UITextField *textField4;
@property (retain, nonatomic) IBOutlet UITextField *textField5;
@property (retain, nonatomic) IBOutlet UITextField *textField6;
@property (retain, nonatomic) IBOutlet UITextField *textField7;
@property (retain, nonatomic) IBOutlet UITextField *textField8;
@property (retain, nonatomic) IBOutlet UITextField *textField9;
@property (retain, nonatomic) NSString *queryName;
@property (assign, nonatomic) id<currentQueryDelegate> delegate;
@end
