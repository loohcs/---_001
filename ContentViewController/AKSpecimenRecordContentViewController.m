//
//  AKSpecimenRecordContentViewController.m
//  农化通
//
//  Created by 凯_SKK on 13-3-4.
//  Copyright (c) 2013年 山东乐世安通通信技术有限公司. All rights reserved.
//

#import "AKSpecimenRecordContentViewController.h"
#import "AKInternetInterface.h"
#import "AKFastLabel.h"
#import "AKFastButton.h"
#import "AKFastView.h"
#import "AKFastImageView.h"
#import "AKFastCallView.h"
@interface AKSpecimenRecordContentViewController ()
-(void)ransmitRequest;//发送请求
-(void)ransmitRequestWithDic:(NSDictionary*)aDic;//发送请求
-(void)refreshContent;//刷新
@end

@implementation AKSpecimenRecordContentViewController

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
    userData = [AKUserData sharedUserData];
    parameterDic = [[NSMutableDictionary alloc]init];
    currentPageStr = [[NSMutableString alloc]init];
    pagecountStr = [[NSMutableString alloc]init];
    currentRequestContent = [[AKCurrentRequest alloc]init];
    currentRequestContent.delegate = self;
    cellViewArray = [[NSMutableArray alloc]init];
    UILabel *topItemLabel = [AKFastLabel labelWithFrame:CGRectMake(0, 0, 180, 30) andText:@"样品记录" andtextAlignment:UITextAlignmentCenter andFont:18];
    self.navigationItem.titleView = topItemLabel;
    UIButton *leftButton = [AKFastButton buttonWithType:UIButtonTypeCustom andFrame:CGRectMake(0, 0, 40, 27) andNormalImage:[UIImage imageNamed:@"top_fh_left.png"] andTouchUpTarget:self andTouchUpAction:@selector(clickLeftBtn)];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]initWithCustomView:leftButton]autorelease];
    UIView *rightBtnView = [AKFastView viewWithWithFrame:CGRectMake(0, 0, 85, 31) andBackgroundColor:[UIColor clearColor]];
    rightBtnView.userInteractionEnabled = YES;
    UIButton *rightReportBtn = [AKFastButton buttonWithType:UIButtonTypeCustom andFrame:CGRectMake(0, 2, 40, 27) andNormalTitle:@"上报" andBackgroundImage:[UIImage imageNamed:@"top_fh_right.png"] andTouchUpTarget:self andTouchUpAction:@selector(reportData)];
    rightReportBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    UIButton *rightRefreshBtn = [AKFastButton buttonWithType:UIButtonTypeCustom andFrame:CGRectMake(45, 2, 40, 27) andNormalTitle:@"刷新" andBackgroundImage:[UIImage imageNamed:@"top_fh_right.png"] andTouchUpTarget:self andTouchUpAction:@selector(refreshContent)];
    rightRefreshBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBtnView addSubview:rightReportBtn];
    [rightBtnView addSubview:rightRefreshBtn];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]initWithCustomView:rightBtnView]autorelease];
    CGRect myScreen=[[UIScreen mainScreen]bounds];
    aTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,CGRectGetWidth(myScreen), CGRectGetHeight(myScreen)-108) style:UITableViewStylePlain];
    aTableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线的样式
    aTableView.backgroundColor = [UIColor clearColor];//透明
    aTableView.delegate = self;
    aTableView.dataSource = self;
    [self.view addSubview:aTableView];
    UIImageView *diImageView = [AKFastImageView imageViewWithFrame:CGRectMake(0, CGRectGetHeight(myScreen)-108, CGRectGetWidth(myScreen), 44) andImage:[UIImage imageNamed:@"di_bar.png"]];
    diImageView.userInteractionEnabled = YES;
    NSArray *labelArray = [NSArray arrayWithObjects:@"查询",@"首页",@"上页",@"下页",@"尾页", nil];
    for (int i=0; i<=4; i++) {
        NSString *imageStr = [NSString stringWithFormat:@"p%d.png",i];
        UIImage *image = [UIImage imageNamed:imageStr];
        CGRect diImageRect = CGRectMake(20+60*i, 0, 32, 32);
        CGRect diLabelRect = CGRectMake(15+60*i, 32, 42, 12);
        UIButton *diButton = [AKFastButton buttonWithType:UIButtonTypeCustom andFrame:diImageRect andNormalImage:image andTouchUpTarget:self andTouchUpAction:@selector(diMethod:) andTag:200+i];
        NSString *labelName = [NSString stringWithFormat:@"%@",[labelArray objectAtIndex:i]];
        UILabel *diLabel = [AKFastLabel labelWithFrame:diLabelRect andText:labelName andtextAlignment:UITextAlignmentCenter andFont:12];
        [diImageView addSubview:diButton];
        [diImageView addSubview:diLabel];
    }
    [self.view addSubview:diImageView];
    mum = [AKUploadMum uploadWhiteMumWithSite:CGPointMake(60, 80) andMunName:@"加载中..."];
    [self.view addSubview:mum];
    [self ransmitRequest];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    [currentRequestContent release];
    [cellViewArray release];
    [pagecountStr release];
    [currentPageStr release];
    [parameterDic release];
    [aTableView release];
    [super dealloc];
}
#pragma - 执行方法
-(void)ransmitRequest//发送请求
{
    mum.hidden = NO;
    NSDictionary *aParameterDic = [NSDictionary dictionaryWithObjectsAndKeys:userData.userId,@"cid",userData.userAccount,@"mobile",userData.userPassword,@"pwd",@"list",@"action",@"",@"pagenum",@"",@"streamno",@"",@"dealerno",@"",@"dealername",@"",@"state",@"",@"pno",@"",@"pname",@"",@"pstyle",@"",@"sdate",@"",@"edate", nil];
    [parameterDic setDictionary:aParameterDic];
    [currentRequestContent currentRequestWithURL:_YANGPIN_INTERFACE_ andParameter:parameterDic];
}
-(void)ransmitRequestWithDic:(NSDictionary*)aDic//发送请求
{
    mum.hidden = NO;
    [currentRequestContent currentRequestWithURL:_YANGPIN_INTERFACE_ andParameter:parameterDic];
}
-(void)reportData//上报
{
    AKIndentReportViewController *specimenReportVC = [[AKIndentReportViewController alloc]init];
    specimenReportVC.delegate = self;
    specimenReportVC.reportTag = 5;
    specimenReportVC.reportName = @"样品上报";
    [self.navigationController pushViewController:specimenReportVC animated:NO];
    [specimenReportVC release];
}

-(void)refreshContent//刷新
{
    [self ransmitRequest];
}
-(void)diMethod:(UIButton*)sender//底部五个按钮的方法
{
    switch (sender.tag) {
        case 200:{
            AKCurrentQueryViewController *currentQueryVC = [[AKCurrentQueryViewController alloc]init];
            currentQueryVC.delegate = self;
            currentQueryVC.queryName = @"样品查询";
            [self.navigationController pushViewController:currentQueryVC animated:NO];
            [currentQueryVC release];
            break;}
        case 201:{
            int pageindex = [currentPageStr intValue];
            if (pageindex<=1) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                               message:@"已经是第一页！"
                                                              delegate:self
                                                     cancelButtonTitle:@"确定"
                                                     otherButtonTitles:nil];
                [alert show];
                [alert release];
            }else{
                [parameterDic setObject:@"1" forKey:@"pagenum"];
                [self ransmitRequestWithDic:parameterDic];
            }
            break;}
        case 202:{
            int pageindex = [currentPageStr intValue];
            if (pageindex<=1) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                               message:@"已经是第一页！"
                                                              delegate:self
                                                     cancelButtonTitle:@"确定"
                                                     otherButtonTitles:nil];
                [alert show];
                [alert release];
            }else{
                pageindex--;
                NSString *pageindexStr = [NSString stringWithFormat:@"%d",pageindex];
                [parameterDic setObject:pageindexStr forKey:@"pagenum"];
                [self ransmitRequestWithDic:parameterDic];
            }
            break;}
        case 203:{
            int pageindex = [currentPageStr intValue];
            int pagecount = [pagecountStr intValue];
            if (pageindex>=pagecount) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                               message:@"已经是最后一页！"
                                                              delegate:self
                                                     cancelButtonTitle:@"确定"
                                                     otherButtonTitles:nil];
                [alert show];
                [alert release];
            }else{
                pageindex++;
                NSString *pageindexStr = [NSString stringWithFormat:@"%d",pageindex];
                [parameterDic setObject:pageindexStr forKey:@"pagenum"];
                [self ransmitRequestWithDic:parameterDic];}
            break;}
        case 204:{
            int pageindex = [currentPageStr intValue];
            int pagecount = [pagecountStr intValue];
            if (pageindex>=pagecount) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                               message:@"已经是最后一页！"
                                                              delegate:self
                                                     cancelButtonTitle:@"确定"
                                                     otherButtonTitles:nil];
                [alert show];
                [alert release];
            }else{
                pageindex = pagecount;
                NSString *pageindexStr = [NSString stringWithFormat:@"%d",pageindex];
                [parameterDic setObject:pageindexStr forKey:@"pagenum"];
                [self ransmitRequestWithDic:parameterDic];}
            break;}
            
        default:
            break;
    }
}
- (void)clickLeftBtn//返回
{
    [self.navigationController popViewControllerAnimated:NO];
}
#pragma - 查询代理
-(void)currentQueryPopWithContentDictionary:(NSDictionary*)aContentDic
{
    NSArray *aParameterArray = [NSArray arrayWithArray:[aContentDic allKeys]];
    for (NSString *str in aParameterArray) {
        [parameterDic setObject:[aContentDic objectForKey:str] forKey:str];
    }
    [self ransmitRequestWithDic:parameterDic];
}
#pragma - 上报成功的代理
-(void)indentReportSucceedPopWillRefresh
{
    [self refreshContent];
}
#pragma - 连接代理
//请求成功
-(void)refreshSucceedWithContentDictionary:(NSDictionary*)aContentDic
{
    mum.hidden = YES;
//    NSLog(@"%@",aContentDic);
    //    NSLog(@"%@",[aContentDic objectForKey:@"cause"]);
    NSString *flagStr = [NSString stringWithFormat:@"%@",[aContentDic objectForKey:@"flag"]];
    if ([flagStr isEqualToString:@"success"]) {
        NSArray *listArray = [aContentDic objectForKey:@"List"];
        if (listArray.count) {
            [cellViewArray setArray:[AKFastCallView specimenRecordCellViewWithArray:listArray]];
            [aTableView reloadData];
            [aTableView setContentOffset:CGPointMake(0, 0)animated:NO];
            
        }else{
            [cellViewArray setArray:nil];
            [aTableView reloadData];
            
        }
        [currentPageStr setString:[NSString stringWithFormat:@"%@",[aContentDic objectForKey:@"currentpage"]]];
        [pagecountStr setString:[NSString stringWithFormat:@"%@",[aContentDic objectForKey:@"pageall"]]];
        
    }else{
        NSString *causeStr = [NSString stringWithFormat:@"%@",[aContentDic objectForKey:@"cause"]];
        if ([causeStr isEqualToString:@""]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                           message:@"数据连接失败"
                                                          delegate:self
                                                 cancelButtonTitle:@"确定"
                                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                           message:causeStr
                                                          delegate:self
                                                 cancelButtonTitle:@"确定"
                                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
        
    }
}
//解析数据失败
-(void)refreshFailWithParameter
{
    mum.hidden = YES;
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                   message:@"数据连接失败"
                                                  delegate:self
                                         cancelButtonTitle:@"确定"
                                         otherButtonTitles:nil];
    [alert show];
    [alert release];
}
//网络问题
-(void)refreshFailWithInternet
{
    mum.hidden = YES;
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                   message:@"网络连接失败，请检查网络后再试！"
                                                  delegate:self
                                         cancelButtonTitle:@"确定"
                                         otherButtonTitles:nil];
    [alert show];
    [alert release];
}
#pragma mark - TableView代理方法
//返回Section的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//返回Row的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cellViewArray.count;
}
//返回cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIView *cellView = [cellViewArray objectAtIndex:indexPath.row];
    CGFloat cellHeight = cellView.frame.size.height;
    return cellHeight;
}
//绘制Cell
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    for(UIView*contentView in cell.contentView.subviews)
    {
        [contentView removeFromSuperview];
    }
    UIView *cellView = [cellViewArray objectAtIndex:indexPath.row];
    [cell.contentView addSubview:cellView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
