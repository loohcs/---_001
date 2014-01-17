//
//  AKMainInterfaceViewController.m
//  农化通
//
//  Created by 凯_SKK on 13-3-2.
//  Copyright (c) 2013年 山东乐世安通通信技术有限公司. All rights reserved.
//

#import "AKMainInterfaceViewController.h"
#import "AKIndentRecordContentViewController.h"
#import "AKAdjustCargoRecordContentViewController.h"
#import "AKSendCargoRecordContentViewController.h"
#import "AKActivityRecordContentViewController.h"
#import "AKSpecimenRecordContentViewController.h"
#import "AKDailyRecordContentViewController.h"
#import "AKPhotoRecordContentViewController.h"
#import "AKProductQueryContentViewController.h"
#import "AKCompanyNoticeContentViewController.h"
#import "AKAlterPasswordViewController.h"
#import "AKFastLabel.h"
#import "AKFastButton.h"
@interface AKMainInterfaceViewController ()

@end

@implementation AKMainInterfaceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationController.navigationBarHidden = NO;
    UILabel *topItemLabel = [AKFastLabel labelWithFrame:CGRectMake(0, 0, 180, 30) andText:@"农化通手机端" andtextAlignment:UITextAlignmentCenter andFont:18];
    self.navigationItem.titleView = topItemLabel;
    UIButton *leftButton = [AKFastButton buttonWithType:UIButtonTypeCustom andFrame:CGRectMake(0, 0, 40, 27) andNormalImage:[UIImage imageNamed:@"top_fh_left.png"] andTouchUpTarget:self andTouchUpAction:@selector(clickLeftBtn)];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]initWithCustomView:leftButton]autorelease];
    NSArray *labelArray = [NSArray arrayWithObjects:@"订单记录",@"调货记录",@"退货记录",@"活动记录",@"样品记录",@"日报记录",@"拍照回传",@"产品查询",@"公司公告",@"修改密码", nil];
    for (int n=0; n<10; n++) {
        int i = n/3;
        int j = n%3;
        NSString *imageStr = [NSString stringWithFormat:@"zcd_%d.png",n+1];
        UIImage *butImage = [UIImage imageNamed:imageStr];
        CGRect butRect = CGRectMake(20+108*j, 15+99*i, 64, 64);
        CGRect labelRect = CGRectMake(10+108*j, 80+99*i, 84, 20);
        UIButton *menuButton = [AKFastButton buttonWithType:UIButtonTypeCustom andFrame:butRect andNormalImage:butImage andTouchUpTarget:self andTouchUpAction:@selector(menuDetails:) andTag:100+n];
        NSString *labelName = [NSString stringWithFormat:@"%@",[labelArray objectAtIndex:n]];
        UILabel *menuLabel = [AKFastLabel labelWithFrame:labelRect andText:labelName andtextAlignment:UITextAlignmentCenter andFont:13];
        [self.view addSubview:menuLabel];
        [self.view addSubview:menuButton];
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma -执行方法
- (void)clickLeftBtn//返回 更换账户
{
    UIAlertView *alertUser = [[UIAlertView alloc]initWithTitle:nil message:@"确定要重新登陆吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertUser show];
    [alertUser release];
}
-(void)menuDetails:(UIButton*)sender
{
    switch (sender.tag) {
        case 100:{
            AKIndentRecordContentViewController *indentRecordContentVC = [[AKIndentRecordContentViewController alloc]init];
            [self.navigationController pushViewController:indentRecordContentVC animated:NO];
            [indentRecordContentVC release];
            break;}
        case 101:{
            AKAdjustCargoRecordContentViewController *adjustCargoRecordContentVC = [[AKAdjustCargoRecordContentViewController alloc]init];
            [self.navigationController pushViewController:adjustCargoRecordContentVC animated:NO];
            [adjustCargoRecordContentVC release];
            break;}
        case 102:{
            AKSendCargoRecordContentViewController *sendCargoRecordContentVC = [[AKSendCargoRecordContentViewController alloc]init];
            [self.navigationController pushViewController:sendCargoRecordContentVC animated:NO];
            [sendCargoRecordContentVC release];
            break;}
        case 103:{
            AKActivityRecordContentViewController *activityRecordContentVC = [[AKActivityRecordContentViewController alloc]init];
            [self.navigationController pushViewController:activityRecordContentVC animated:NO];
            [activityRecordContentVC release];
            break;}
        case 104:{
            AKSpecimenRecordContentViewController *specimenRecordContentVC = [[AKSpecimenRecordContentViewController alloc]init];
            [self.navigationController pushViewController:specimenRecordContentVC animated:NO];
            [specimenRecordContentVC release];
            break;}
        case 105:{
            AKDailyRecordContentViewController *dailyRecordContentVC = [[AKDailyRecordContentViewController alloc]init];
            [self.navigationController pushViewController:dailyRecordContentVC animated:NO];
            [dailyRecordContentVC release];
            break;}
        case 106:{
            AKPhotoRecordContentViewController *photoRecordContentVC = [[AKPhotoRecordContentViewController alloc]init];
            [self.navigationController pushViewController:photoRecordContentVC animated:NO];
            [photoRecordContentVC release];
            break;}
        case 107:{
            AKProductQueryContentViewController *productQueryContentVC = [[AKProductQueryContentViewController alloc]init];
            [self.navigationController pushViewController:productQueryContentVC animated:NO];
            [productQueryContentVC release];
            break;}
        case 108:{
            AKCompanyNoticeContentViewController *companyNoticeContentVC = [[AKCompanyNoticeContentViewController alloc]init];
            [self.navigationController pushViewController:companyNoticeContentVC animated:NO];
            [companyNoticeContentVC release];
            break;}
        case 109:{
            AKAlterPasswordViewController *alterPasswordVC = [[AKAlterPasswordViewController alloc]init];
            [self.navigationController pushViewController:alterPasswordVC animated:NO];
            [alterPasswordVC release];
            break;}
            
        default:
            break;
    }
}
#pragma - 代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 1:
            [self.navigationController popViewControllerAnimated:NO];
            break;
            
        default:
            break;
    }
}
@end
