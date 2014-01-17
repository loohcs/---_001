//
//  AKIndentReportViewController.m
//  农化通
//
//  Created by 凯_SKK on 13-3-12.
//  Copyright (c) 2013年 山东乐世安通通信技术有限公司. All rights reserved.
//

#import "AKIndentReportViewController.h"
#import "AKFastLabel.h"
#import "AKFastButton.h"
#import "AKFastCallView.h"
#import "AKInternetInterface.h"
@interface AKIndentReportViewController ()

@end

@implementation AKIndentReportViewController
@synthesize delegate;
@synthesize reportName = _reportName;
@synthesize reportTag = _reportTag;
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
    reportParameterDic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:userData.userId,@"cid",userData.userAccount,@"mobile",userData.userPassword,@"pwd",@"add",@"action",@"",@"intro",@"",@"xml",@"",@"dealerno",@"",@"dealername", nil];
    cellArray = [[NSMutableArray alloc]init];
    cellViewArray = [[NSMutableArray alloc]init];
    currentRequest = [[AKCurrentRequest alloc]init];
    currentRequest.delegate = self;
    self.aTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UILabel *topItemLabel = [AKFastLabel labelWithFrame:CGRectMake(0, 0, 180, 30) andText:_reportName andtextAlignment:UITextAlignmentCenter andFont:18];
    self.navigationItem.titleView = topItemLabel;
    UIButton *leftButton = [AKFastButton buttonWithType:UIButtonTypeCustom andFrame:CGRectMake(0, 0, 40, 27) andNormalImage:[UIImage imageNamed:@"top_fh_left.png"] andTouchUpTarget:self andTouchUpAction:@selector(clickLeftBtn)];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]initWithCustomView:leftButton]autorelease];
    UIButton *rightButton = [AKFastButton buttonWithType:UIButtonTypeCustom andFrame:CGRectMake(0, 0, 40, 27) andNormalTitle:@"上报" andBackgroundImage:[UIImage imageNamed:@"top_fh_right.png"] andTouchUpTarget:self andTouchUpAction:@selector(reportRightBtn)];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]initWithCustomView:rightButton]autorelease];
    mum = [AKUploadMum uploadWhiteMumWithSite:CGPointMake(60, 80) andMunName:@"正在上传..."];
    [self.view addSubview:mum];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_textField1 release];
    [_textField2 release];
    [_textField3 release];
    [_aTableView release];
    [reportParameterDic release];
    [currentRequest release];
    [cellArray release];
    [cellViewArray release];
    [_reportName release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTextField1:nil];
    [self setTextField2:nil];
    [self setTextField3:nil];
    [self setATableView:nil];
    [super viewDidUnload];
}
#pragma - 执行方法
-(void)reportRightBtn
{
    [self touchesBegan:nil withEvent:nil];
    if ([self.textField1.text isEqualToString:@""]
        ||[self.textField2.text isEqualToString:@""]
        ||cellArray.count==0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                       message:@"请输入完整上报内容！"
                                                      delegate:self
                                             cancelButtonTitle:@"确定"
                                             otherButtonTitles:nil];
        [alert show];
        [alert release];
    }else{
        [reportParameterDic setObject:self.textField1.text forKey:@"dealerno"];
        [reportParameterDic setObject:self.textField2.text forKey:@"dealername"];
        [reportParameterDic setObject:self.textField3.text forKey:@"intro"];
        NSMutableString *xmlStr = [NSMutableString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<root></root>"];
        for (NSDictionary *dic in cellArray) {
            NSString *str = [NSString stringWithFormat:@"<node pno=\"%@\" pname=\"%@\" pstyle=\"%@\" price=\"%@\" pnum=\"%@\" />",[dic objectForKey:@"pno"],[dic objectForKey:@"pname"],[dic objectForKey:@"pstyle"],[dic objectForKey:@"price"],[dic objectForKey:@"pnum"]];
            NSInteger index = xmlStr.length-7;
            [xmlStr insertString:str atIndex:index];
        }
        [reportParameterDic setObject:xmlStr forKey:@"xml"];
        switch (_reportTag) {
            case 1:
                [currentRequest currentRequestWithURL:_DINGDAN_INTERFACE_ andParameter:reportParameterDic];
                break;
            case 3:
                [currentRequest currentRequestWithURL:_TUIHUO_INTERFACE_ andParameter:reportParameterDic];
                break;
            case 5:
                [currentRequest currentRequestWithURL:_YANGPIN_INTERFACE_ andParameter:reportParameterDic];
                break;
            default:
                break;
        }
        
        mum.hidden = NO;
    }
}
-(void)clickLeftBtn
{
    [self.navigationController popViewControllerAnimated:NO];
}
- (IBAction)choiceCustomer:(id)sender//选取客户
{
    AKCustomerChoiceViewController *customerChoiceVC = [[AKCustomerChoiceViewController alloc]init];
    customerChoiceVC.delegate = self;
    [self.navigationController pushViewController:customerChoiceVC animated:NO];
    [customerChoiceVC release];
}
- (IBAction)choiceProduct:(id)sender//选取产品
{
    [self touchesBegan:nil withEvent:nil];
    AKProductChoiceViewController *productChoiceVC = [[AKProductChoiceViewController alloc]init];
    productChoiceVC.delegate = self;
    [self.navigationController pushViewController:productChoiceVC animated:NO];
    [productChoiceVC release];
}
-(void)deleteProduct:(UIButton*)sender//删除产品
{
    buttonTag = sender.tag;
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil
                                                   message:@"确定要删除吗？"
                                                  delegate:self
                                         cancelButtonTitle:@"取消"
                                         otherButtonTitles:@"确定",nil];
    [alert show];
    [alert release];
}
#pragma mark - 客户选择 产品选择
-(void)customerChoiceSucceedPopWithDictionary:(NSDictionary*)aDic
{
    NSString *oneText = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"customno"]];
    self.textField1.text = oneText;
    NSString *twoText = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"cname"]];
    self.textField2.text = twoText;
}
-(void)productChoiceSucceedPopWithDictionary:(NSDictionary *)aDic
{
    [cellArray addObject:aDic];
    [cellViewArray setArray:[AKFastCallView reportCellViewWithArray:cellArray andDeleteTouchUpTarget:self andDeleteTouchUpAction:@selector(deleteProduct:)]];
    [self.aTableView reloadData];
}
#pragma mark - alert代理（删除）
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            break;
        case 1:{
            [cellArray removeObjectAtIndex:buttonTag-100];
            [cellViewArray setArray:[AKFastCallView reportCellViewWithArray:cellArray andDeleteTouchUpTarget:self andDeleteTouchUpAction:@selector(deleteProduct:)]];
            [self.aTableView reloadData];
            break;}
            
        default:
            break;
    }
}
#pragma mark - refresh代理方法
//请求成功
-(void)refreshSucceedWithContentDictionary:(NSDictionary*)aContentDic
{
    mum.hidden = YES;
    NSString *flagStr = [NSString stringWithFormat:@"%@",[aContentDic objectForKey:@"flag"]];
    NSString *causeStr = [NSString stringWithFormat:@"%@",[aContentDic objectForKey:@"cause"]];
    if ([flagStr isEqualToString:@"success"]) {
        [self.navigationController popViewControllerAnimated:NO];
        [delegate indentReportSucceedPopWillRefresh];
    }
    else{
        if ([causeStr isEqualToString:@""]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                           message:@"数据上传失败，请重新上传。"
                                                          delegate:self
                                                 cancelButtonTitle:@"确定"
                                                 otherButtonTitles:nil];
            [alert show];
            [alert release];
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                           message:causeStr
                                                          delegate:nil
                                                 cancelButtonTitle:@"确定"
                                                 otherButtonTitles:nil];
            [alert show];
            [alert release];}
    }
}
//解析数据失败
-(void)refreshFailWithParameter
{
    mum.hidden = YES;
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                   message:@"数据上传失败，请重新上传。"
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
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView beginAnimations:@"Animations" context:nil]; //context传值
    [UIView setAnimationDuration:0.25f];
    CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 0);
    self.view.transform = translation;
    [UIView commitAnimations];
    [self.textField1 resignFirstResponder];
    [self.textField2 resignFirstResponder];
    [self.textField3 resignFirstResponder];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 401:{
            [UIView beginAnimations:@"Animations" context:nil]; //context传值
            [UIView setAnimationDuration:0.25f];
            CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 0);
            self.view.transform = translation;
            [UIView commitAnimations];
            return NO;
            break;}
        case 402:{
            [UIView beginAnimations:@"Animations" context:nil]; //context传值
            [UIView setAnimationDuration:0.25f];
            CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 0);
            self.view.transform = translation;
            [UIView commitAnimations];
            return NO;
            break;}
        case 403:{
            [UIView beginAnimations:@"Animations" context:nil]; //context传值
            [UIView setAnimationDuration:0.25f];
            CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 0);
            self.view.transform = translation;
            [UIView commitAnimations];
            return YES;
            break;}
        default:
            break;
    }
    return NO;
}
@end
