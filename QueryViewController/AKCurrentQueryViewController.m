//
//  AKCurrentQueryViewController.m
//  农化通
//
//  Created by 凯_SKK on 13-3-7.
//  Copyright (c) 2013年 山东乐世安通通信技术有限公司. All rights reserved.
//

#import "AKCurrentQueryViewController.h"
#import "AKFastLabel.h"
#import "AKFastButton.h"
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
@interface AKCurrentQueryViewController ()

@end

@implementation AKCurrentQueryViewController
@synthesize queryName = _queryName;
@synthesize delegate;
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
    UILabel *topItemLabel = [AKFastLabel labelWithFrame:CGRectMake(0, 0, 180, 30) andText:_queryName andtextAlignment:UITextAlignmentCenter andFont:18];
    self.navigationItem.titleView = topItemLabel;
    UIButton *leftButton = [AKFastButton buttonWithType:UIButtonTypeCustom andFrame:CGRectMake(0, 0, 40, 27) andNormalTitle:@"取消" andBackgroundImage:[UIImage imageNamed:@"top_fh_right.png"] andTouchUpTarget:self andTouchUpAction:@selector(clickLeftBtn)];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]initWithCustomView:leftButton]autorelease];
    UIButton *rightRefreshBtn = [AKFastButton buttonWithType:UIButtonTypeCustom andFrame:CGRectMake(0, 0, 40, 27) andNormalTitle:@"查询" andBackgroundImage:[UIImage imageNamed:@"top_fh_right.png"] andTouchUpTarget:self andTouchUpAction:@selector(clickRightBtn)];
    rightRefreshBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]initWithCustomView:rightRefreshBtn]autorelease];
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
    [_textField4 release];
    [_textField5 release];
    [_textField6 release];
    [_textField7 release];
    [_textField8 release];
    [_textField9 release];
    [_queryName release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTextField1:nil];
    [self setTextField2:nil];
    [self setTextField3:nil];
    [self setTextField4:nil];
    [self setTextField5:nil];
    [self setTextField6:nil];
    [self setTextField7:nil];
    [self setTextField8:nil];
    [self setTextField9:nil];
    [super viewDidUnload];
}
#pragma - 执行方法

- (void)clickLeftBtn//返回
{
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)clickRightBtn//查询
{
    NSDictionary *queryParameterDic = [NSDictionary dictionaryWithObjectsAndKeys:@"",@"pagenum",self.textField1.text,@"streamno",self.textField2.text,@"dealerno",self.textField3.text,@"dealername",self.textField4.text,@"state",self.textField5.text,@"pno",self.textField6.text,@"pname",self.textField7.text,@"pstyle",self.textField8.text,@"sdate",self.textField9.text,@"edate", nil];
    [delegate currentQueryPopWithContentDictionary:queryParameterDic];
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textField1 resignFirstResponder];
    [self.textField2 resignFirstResponder];
    [self.textField3 resignFirstResponder];
    [self.textField4 resignFirstResponder];
    [self.textField5 resignFirstResponder];
    [self.textField6 resignFirstResponder];
    [self.textField7 resignFirstResponder];
    [self.textField8 resignFirstResponder];
    [self.textField9 resignFirstResponder];
    [UIView beginAnimations:@"Animations" context:nil]; //context传值
    [UIView setAnimationDuration:0.25f];
    CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 0);
    self.view.transform = translation;
    [UIView commitAnimations];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (!iPhone5) {
        switch (textField.tag) {
            case 401:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 0);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 402:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 0);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 403:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 0);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 404:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, -15);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 405:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, -50);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 406:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, -90);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 407:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, -130);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 408:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, -165);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 409:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, -165);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            default:
                break;
        }
    }else{
        switch (textField.tag) {
            case 401:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 0);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 402:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 0);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 403:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 0);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 404:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 0);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 405:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 0);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 406:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, 0);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 407:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, -30);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 408:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, -70);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            case 409:{
                [UIView beginAnimations:@"Animations" context:nil]; //context传值
                [UIView setAnimationDuration:0.25f];
                CGAffineTransform translation = CGAffineTransformMakeTranslation(0, -70);
                self.view.transform = translation;
                [UIView commitAnimations];
                break;}
            default:
                break;
        }
    }
}
@end
