//
//  AKFastCallView.m
//  农化通
//
//  Created by 凯_SKK on 13-3-5.
//  Copyright (c) 2013年 山东乐世安通通信技术有限公司. All rights reserved.
//

#import "AKFastCallView.h"
#import "AKFastLabel.h"
#import "AKFastImageView.h"
#import "AKFastView.h"
#import "AKFastImageView.h"
#import "AKFastButton.h"
#define _CELL_FONT_ 13  //字体大小
#define _MIN_CELL_FONT_ 11  //字体大小
#define _START_INTERVAL_ 5 //开头的间隔
#define _START2_INTERVAL_ 170 //开头的间隔
#define _LINE_HEIGHT_ 14 //每行的高度
#define _LINE2_HEIGHT_ 18 //每行的高度
#define _COMMON_CONTENT_WIDTH_ 150 //普通宽度
#define _ONE_WIDTH_ 20
#define _TWO_WIDTH_ 40
#define _THREE_WIDTH_ 50
#define _FOUR_WIDTH_ 65
#define _FIVE_WIDTH_ 80
#define _SIX_WIDTH_ 95
#define _SEVEN_WIDTH_ 110
#define _EIGHT_WIDTH_ 125
@implementation AKFastCallView
+(NSMutableArray*)indentRecordCellViewWithArray:(NSArray*)aArray//订单记录
{
    NSMutableArray *cellArray = [[NSMutableArray alloc]init];
    for (NSDictionary *aDic in aArray) {
        NSString *str1 = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"streamno"]];
        NSString *str1_1 = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"dealername"]];
        NSString *str2 = [NSString stringWithFormat:@"产品编码：%@",[aDic objectForKey:@"pno"]];
        NSString *str2_1 = [NSString stringWithFormat:@"产品名称：%@",[aDic objectForKey:@"pname"]];
        NSString *str3 = [NSString stringWithFormat:@"产品规格：%@",[aDic objectForKey:@"pstyle"]];
        NSString *str3_1 = [NSString stringWithFormat:@"订单数量：%@",[aDic objectForKey:@"num"]];
        NSString *str4 = [NSString stringWithFormat:@"状态：%@",[aDic objectForKey:@"state"]];
        NSString *str4_1 = [NSString stringWithFormat:@"上报时间：%@",[aDic objectForKey:@"createtime"]];
        UILabel *contentLabel1 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5, 145-_START_INTERVAL_, _LINE_HEIGHT_) andText:str1 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel1_1 = [AKFastLabel labelWithFrame:CGRectMake(160, 5, 155, _LINE_HEIGHT_) andText:str1_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel2 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+_LINE2_HEIGHT_, 145-_START_INTERVAL_, _LINE_HEIGHT_) andText:str2 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel2_1 = [AKFastLabel labelWithFrame:CGRectMake(160, 5+_LINE2_HEIGHT_, 155, _LINE_HEIGHT_) andText:str2_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel3 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+2*_LINE2_HEIGHT_, 165-_START_INTERVAL_, _LINE_HEIGHT_) andText:str3 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel3_1 = [AKFastLabel labelWithFrame:CGRectMake(180, 5+2*_LINE2_HEIGHT_, 315-180, _LINE_HEIGHT_) andText:str3_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel4 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+3*_LINE2_HEIGHT_, 115-_START_INTERVAL_, _LINE_HEIGHT_) andText:str4 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel4_1 = [AKFastLabel labelWithFrame:CGRectMake(130, 5+3*_LINE2_HEIGHT_, 185, _LINE_HEIGHT_) andText:str4_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UIImageView *boundaryImageView = [AKFastImageView imageViewWithFrame:CGRectMake(0, contentLabel4.frame.origin.y+_LINE_HEIGHT_+5, 320, 2) andImage:[UIImage imageNamed:@"divider.png"]];
        UIView *cellView = [AKFastView viewWithWithFrame:CGRectMake(0, 0, 320, contentLabel4.frame.origin.y+_LINE_HEIGHT_+7) andBackgroundColor:[UIColor clearColor]];
        [cellView addSubview:contentLabel1];
        [cellView addSubview:contentLabel1_1];
        [cellView addSubview:contentLabel2];
        [cellView addSubview:contentLabel2_1];
        [cellView addSubview:contentLabel3];
        [cellView addSubview:contentLabel3_1];
        [cellView addSubview:contentLabel4];
        [cellView addSubview:contentLabel4_1];
        [cellView addSubview:boundaryImageView];
        [cellArray addObject:cellView];
    }
    return [cellArray autorelease];
}
+(NSMutableArray*)adjustCargoRecordCellViewWithArray:(NSArray*)aArray//调货记录
{
    NSMutableArray *cellArray = [[NSMutableArray alloc]init];
    for (NSDictionary *aDic in aArray) {
        NSString *str1 = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"streamno"]];
        NSString *str1_1 = [NSString stringWithFormat:@"调入客户：%@",[aDic objectForKey:@"idealername"]];
        NSString *str2 = [NSString stringWithFormat:@"调出客户：%@",[aDic objectForKey:@"odealername"]];
        NSString *str3 = [NSString stringWithFormat:@"产品编码：%@",[aDic objectForKey:@"pno"]];
        NSString *str3_1 = [NSString stringWithFormat:@"产品名称：%@",[aDic objectForKey:@"pname"]];
        NSString *str4 = [NSString stringWithFormat:@"产品规格：%@",[aDic objectForKey:@"pstyle"]];
        NSString *str4_1 = [NSString stringWithFormat:@"订单数量：%@",[aDic objectForKey:@"pnum"]];
        NSString *str5 = [NSString stringWithFormat:@"调入价：%@",[aDic objectForKey:@"iprice"]];
        NSString *str5_1 = [NSString stringWithFormat:@"调出价：%@",[aDic objectForKey:@"oprice"]];
        NSString *str6 = [NSString stringWithFormat:@"状态：%@",[aDic objectForKey:@"state"]];
        NSString *str6_1 = [NSString stringWithFormat:@"上报时间：%@",[aDic objectForKey:@"createtime"]];
        UILabel *contentLabel1 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5, 110-_START_INTERVAL_, _LINE_HEIGHT_) andText:str1 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel1_1 = [AKFastLabel labelWithFrame:CGRectMake(120, 5, 195, _LINE_HEIGHT_) andText:str1_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel2 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+_LINE2_HEIGHT_, 315-_START_INTERVAL_, _LINE_HEIGHT_) andText:str2 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel3 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+2*_LINE2_HEIGHT_, 145-_START_INTERVAL_, _LINE_HEIGHT_) andText:str3 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel3_1 = [AKFastLabel labelWithFrame:CGRectMake(160, 5+2*_LINE2_HEIGHT_, 315-160, _LINE_HEIGHT_) andText:str3_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel4 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+3*_LINE2_HEIGHT_, 170-_START_INTERVAL_, _LINE_HEIGHT_) andText:str4 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel4_1 = [AKFastLabel labelWithFrame:CGRectMake(180, 5+3*_LINE2_HEIGHT_, 315-180, _LINE_HEIGHT_) andText:str4_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel5 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+4*_LINE2_HEIGHT_, 155-_START_INTERVAL_, _LINE_HEIGHT_) andText:str5 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel5_1 = [AKFastLabel labelWithFrame:CGRectMake(170, 5+4*_LINE2_HEIGHT_, 315-170, _LINE_HEIGHT_) andText:str5_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel6 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+5*_LINE2_HEIGHT_, 115-_START_INTERVAL_, _LINE_HEIGHT_) andText:str6 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel6_1 = [AKFastLabel labelWithFrame:CGRectMake(130, 5+5*_LINE2_HEIGHT_, 185, _LINE_HEIGHT_) andText:str6_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UIImageView *boundaryImageView = [AKFastImageView imageViewWithFrame:CGRectMake(0, contentLabel6.frame.origin.y+_LINE_HEIGHT_+5, 320, 2) andImage:[UIImage imageNamed:@"divider.png"]];
        UIView *cellView = [AKFastView viewWithWithFrame:CGRectMake(0, 0, 320, contentLabel6.frame.origin.y+_LINE_HEIGHT_+7) andBackgroundColor:[UIColor clearColor]];
        [cellView addSubview:contentLabel1];
        [cellView addSubview:contentLabel1_1];
        [cellView addSubview:contentLabel2];
        [cellView addSubview:contentLabel3];
        [cellView addSubview:contentLabel3_1];
        [cellView addSubview:contentLabel4];
        [cellView addSubview:contentLabel4_1];
        [cellView addSubview:contentLabel5];
        [cellView addSubview:contentLabel5_1];
        [cellView addSubview:contentLabel6];
        [cellView addSubview:contentLabel6_1];
        [cellView addSubview:boundaryImageView];
        [cellArray addObject:cellView];
    }
    return [cellArray autorelease];
}
+(NSMutableArray*)sendCargoRecordCellViewWithArray:(NSArray*)aArray//退货记录
{
    NSMutableArray *cellArray = [[NSMutableArray alloc]init];
    for (NSDictionary *aDic in aArray) {
        NSString *str1 = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"streamno"]];
        NSString *str1_1 = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"dealername"]];
        NSString *str2 = [NSString stringWithFormat:@"产品编码：%@",[aDic objectForKey:@"pno"]];
        NSString *str2_1 = [NSString stringWithFormat:@"产品名称：%@",[aDic objectForKey:@"pname"]];
        NSString *str3 = [NSString stringWithFormat:@"产品规格：%@",[aDic objectForKey:@"pstyle"]];
        NSString *str3_1 = [NSString stringWithFormat:@"退货数量：%@",[aDic objectForKey:@"num"]];
        NSString *str4 = [NSString stringWithFormat:@"状态：%@",[aDic objectForKey:@"state"]];
        NSString *str4_1 = [NSString stringWithFormat:@"上报时间：%@",[aDic objectForKey:@"createtime"]];
        UILabel *contentLabel1 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5, 145-_START_INTERVAL_, _LINE_HEIGHT_) andText:str1 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel1_1 = [AKFastLabel labelWithFrame:CGRectMake(160, 5, 155, _LINE_HEIGHT_) andText:str1_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel2 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+_LINE2_HEIGHT_, 145-_START_INTERVAL_, _LINE_HEIGHT_) andText:str2 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel2_1 = [AKFastLabel labelWithFrame:CGRectMake(160, 5+_LINE2_HEIGHT_, 155, _LINE_HEIGHT_) andText:str2_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel3 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+2*_LINE2_HEIGHT_, 165-_START_INTERVAL_, _LINE_HEIGHT_) andText:str3 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel3_1 = [AKFastLabel labelWithFrame:CGRectMake(180, 5+2*_LINE2_HEIGHT_, 315-180, _LINE_HEIGHT_) andText:str3_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel4 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+3*_LINE2_HEIGHT_, 115-_START_INTERVAL_, _LINE_HEIGHT_) andText:str4 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel4_1 = [AKFastLabel labelWithFrame:CGRectMake(130, 5+3*_LINE2_HEIGHT_, 185, _LINE_HEIGHT_) andText:str4_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UIImageView *boundaryImageView = [AKFastImageView imageViewWithFrame:CGRectMake(0, contentLabel4.frame.origin.y+_LINE_HEIGHT_+5, 320, 2) andImage:[UIImage imageNamed:@"divider.png"]];
        UIView *cellView = [AKFastView viewWithWithFrame:CGRectMake(0, 0, 320, contentLabel4.frame.origin.y+_LINE_HEIGHT_+7) andBackgroundColor:[UIColor clearColor]];
        [cellView addSubview:contentLabel1];
        [cellView addSubview:contentLabel1_1];
        [cellView addSubview:contentLabel2];
        [cellView addSubview:contentLabel2_1];
        [cellView addSubview:contentLabel3];
        [cellView addSubview:contentLabel3_1];
        [cellView addSubview:contentLabel4];
        [cellView addSubview:contentLabel4_1];
        [cellView addSubview:boundaryImageView];
        [cellArray addObject:cellView];
    }
    return [cellArray autorelease];
}
+(NSMutableArray*)activityRecordCellViewWithArray:(NSArray*)aArray//活动记录
{
    NSMutableArray *cellArray = [[NSMutableArray alloc]init];
    for (NSDictionary *aDic in aArray) {
        NSString *str1 = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"dealerName"]];
        NSString *str2 = [NSString stringWithFormat:@"活动费用：%@",[aDic objectForKey:@"price"]];
        NSString *str2_1 = [NSString stringWithFormat:@"经办人：%@",[aDic objectForKey:@"adder"]];
        NSString *str3 = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"content"]];
        NSString *str4 = [NSString stringWithFormat:@"状态：%@",[aDic objectForKey:@"ischeck"]];
        NSString *str4_1 = [NSString stringWithFormat:@"上报时间：%@",[aDic objectForKey:@"createtime"]];
        UILabel *contentLabel1 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5, 315-_START_INTERVAL_, _LINE_HEIGHT_) andText:str1 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel2 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+_LINE2_HEIGHT_, 145-_START_INTERVAL_, _LINE_HEIGHT_) andText:str2 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel2_1 = [AKFastLabel labelWithFrame:CGRectMake(160, 5+_LINE2_HEIGHT_, 155, _LINE_HEIGHT_) andText:str2_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *label3 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+2*_LINE2_HEIGHT_, _FOUR_WIDTH_, _LINE_HEIGHT_) andText:@"活动内容：" andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel3 = [AKFastLabel cellLabelWithFrame:CGRectMake(_START_INTERVAL_+_FOUR_WIDTH_, 5+2*_LINE2_HEIGHT_, 310-_START_INTERVAL_-_FOUR_WIDTH_, 0) andText:str3 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_ andLines:0];
        CGFloat label4Float;
        if (_LINE_HEIGHT_>=contentLabel3.frame.size.height) {
            label4Float = _LINE_HEIGHT_;
        }else{
            label4Float = contentLabel3.frame.size.height;
        }
        UILabel *contentLabel4 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 4+label3.frame.origin.y+label4Float, 115-_START_INTERVAL_, _LINE_HEIGHT_) andText:str4 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel4_1 = [AKFastLabel labelWithFrame:CGRectMake(130, 4+label3.frame.origin.y+label4Float, 185, _LINE_HEIGHT_) andText:str4_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UIImageView *boundaryImageView = [AKFastImageView imageViewWithFrame:CGRectMake(0, contentLabel4.frame.origin.y+_LINE_HEIGHT_+5, 320, 2) andImage:[UIImage imageNamed:@"divider.png"]];
        UIView *cellView = [AKFastView viewWithWithFrame:CGRectMake(0, 0, 320, contentLabel4.frame.origin.y+_LINE_HEIGHT_+7) andBackgroundColor:[UIColor clearColor]];
        [cellView addSubview:contentLabel1];
        [cellView addSubview:contentLabel2];
        [cellView addSubview:contentLabel2_1];
        [cellView addSubview:label3];
        [cellView addSubview:contentLabel3];
        [cellView addSubview:contentLabel4];
        [cellView addSubview:contentLabel4_1];
        [cellView addSubview:boundaryImageView];
        [cellArray addObject:cellView];
    }
    return [cellArray autorelease];
}
+(NSMutableArray*)specimenRecordCellViewWithArray:(NSArray*)aArray//样品记录
{
    NSMutableArray *cellArray = [[NSMutableArray alloc]init];
    for (NSDictionary *aDic in aArray) {
        NSString *str1 = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"streamno"]];
        NSString *str1_1 = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"dealername"]];
        NSString *str2 = [NSString stringWithFormat:@"产品编码：%@",[aDic objectForKey:@"pno"]];
        NSString *str2_1 = [NSString stringWithFormat:@"产品名称：%@",[aDic objectForKey:@"pname"]];
        NSString *str3 = [NSString stringWithFormat:@"产品规格：%@",[aDic objectForKey:@"pstyle"]];
        NSString *str3_1 = [NSString stringWithFormat:@"样品数量：%@",[aDic objectForKey:@"num"]];
        NSString *str4 = [NSString stringWithFormat:@"状态：%@",[aDic objectForKey:@"state"]];
        NSString *str4_1 = [NSString stringWithFormat:@"上报时间：%@",[aDic objectForKey:@"createtime"]];
        UILabel *contentLabel1 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5, 145-_START_INTERVAL_, _LINE_HEIGHT_) andText:str1 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel1_1 = [AKFastLabel labelWithFrame:CGRectMake(160, 5, 155, _LINE_HEIGHT_) andText:str1_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel2 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+_LINE2_HEIGHT_, 145-_START_INTERVAL_, _LINE_HEIGHT_) andText:str2 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel2_1 = [AKFastLabel labelWithFrame:CGRectMake(160, 5+_LINE2_HEIGHT_, 155, _LINE_HEIGHT_) andText:str2_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel3 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+2*_LINE2_HEIGHT_, 165-_START_INTERVAL_, _LINE_HEIGHT_) andText:str3 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel3_1 = [AKFastLabel labelWithFrame:CGRectMake(180, 5+2*_LINE2_HEIGHT_, 315-180, _LINE_HEIGHT_) andText:str3_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel4 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+3*_LINE2_HEIGHT_, 115-_START_INTERVAL_, _LINE_HEIGHT_) andText:str4 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel4_1 = [AKFastLabel labelWithFrame:CGRectMake(130, 5+3*_LINE2_HEIGHT_, 185, _LINE_HEIGHT_) andText:str4_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UIImageView *boundaryImageView = [AKFastImageView imageViewWithFrame:CGRectMake(0, contentLabel4.frame.origin.y+_LINE_HEIGHT_+5, 320, 2) andImage:[UIImage imageNamed:@"divider.png"]];
        UIView *cellView = [AKFastView viewWithWithFrame:CGRectMake(0, 0, 320, contentLabel4.frame.origin.y+_LINE_HEIGHT_+7) andBackgroundColor:[UIColor clearColor]];
        [cellView addSubview:contentLabel1];
        [cellView addSubview:contentLabel1_1];
        [cellView addSubview:contentLabel2];
        [cellView addSubview:contentLabel2_1];
        [cellView addSubview:contentLabel3];
        [cellView addSubview:contentLabel3_1];
        [cellView addSubview:contentLabel4];
        [cellView addSubview:contentLabel4_1];
        [cellView addSubview:boundaryImageView];
        [cellArray addObject:cellView];
    }
    return [cellArray autorelease];
}
+(NSMutableArray*)dailyRecordCellViewWithArray:(NSArray*)aArray//日报记录
{
    NSMutableArray *cellArray = [[NSMutableArray alloc]init];
    for (NSDictionary *aDic in aArray) {
        NSString *str1 = [NSString stringWithFormat:@"上报人：%@",[aDic objectForKey:@"ename"]];
        NSString *str2 = [NSString stringWithFormat:@"标题：%@",[aDic objectForKey:@"title"]];
        NSString *str3 = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"content"]];
        NSString *str4 = [NSString stringWithFormat:@"上报时间：%@",[aDic objectForKey:@"createtime"]];
        UILabel *contentLabel1 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5, 315-_START_INTERVAL_, _LINE_HEIGHT_) andText:str1 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel2 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+_LINE2_HEIGHT_, 315-_START_INTERVAL_, _LINE_HEIGHT_) andText:str2 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *label3 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+2*_LINE2_HEIGHT_, _TWO_WIDTH_, _LINE_HEIGHT_) andText:@"内容：" andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel3 = [AKFastLabel cellLabelWithFrame:CGRectMake(_START_INTERVAL_+_TWO_WIDTH_, 5+2*_LINE2_HEIGHT_, 315-_START_INTERVAL_-_TWO_WIDTH_, 0) andText:str3 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_ andLines:0];
        CGFloat label4Float;
        if (_LINE_HEIGHT_>=contentLabel3.frame.size.height) {
            label4Float = _LINE_HEIGHT_;
        }else{
            label4Float = contentLabel3.frame.size.height;
        }
        UILabel *contentLabel4 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 4+contentLabel3.frame.origin.y+label4Float, 315-_START_INTERVAL_, _LINE_HEIGHT_) andText:str4 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UIImageView *boundaryImageView = [AKFastImageView imageViewWithFrame:CGRectMake(0, contentLabel4.frame.origin.y+_LINE_HEIGHT_+5, 320, 2) andImage:[UIImage imageNamed:@"divider.png"]];
        UIView *cellView = [AKFastView viewWithWithFrame:CGRectMake(0, 0, 320, contentLabel4.frame.origin.y+_LINE_HEIGHT_+7) andBackgroundColor:[UIColor clearColor]];
        [cellView addSubview:contentLabel1];
        [cellView addSubview:contentLabel2];
        [cellView addSubview:label3];
        [cellView addSubview:contentLabel3];
        [cellView addSubview:contentLabel4];
        [cellView addSubview:boundaryImageView];
        [cellArray addObject:cellView];
    }
    return [cellArray autorelease];
}
+(NSMutableArray*)photoRecordCellViewWithArray:(NSArray*)aArray//照片回传
{
    NSMutableArray *cellArray = [[NSMutableArray alloc]init];
    for (NSDictionary *aDic in aArray) {
        NSString *str1 = [NSString stringWithFormat:@"业务员：%@",[aDic objectForKey:@"employ"]];
        NSString *str1_1 = [NSString stringWithFormat:@"客户：%@",[aDic objectForKey:@"mname"]];
        NSString *str2 = [NSString stringWithFormat:@"时间：%@",[aDic objectForKey:@"createtime"]];
        NSString *str3 = [NSString stringWithFormat:@"标题：%@",[aDic objectForKey:@"title"]];
        NSString *str4 = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"content"]];
        UILabel *contentLabel1 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5, 145-_START_INTERVAL_, _LINE_HEIGHT_) andText:str1 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel1_1 = [AKFastLabel labelWithFrame:CGRectMake(160, 5, 155, _LINE_HEIGHT_) andText:str1_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel2 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+_LINE2_HEIGHT_, 315-_START_INTERVAL_, _LINE_HEIGHT_) andText:str2 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel3 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+2*_LINE2_HEIGHT_, 315-_START_INTERVAL_, _LINE_HEIGHT_) andText:str3 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *label4 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+3*_LINE2_HEIGHT_, _TWO_WIDTH_, _LINE_HEIGHT_) andText:@"备注：" andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel4 = [AKFastLabel cellLabelWithFrame:CGRectMake( _START_INTERVAL_+_TWO_WIDTH_, 5+3*_LINE2_HEIGHT_, 315-_START_INTERVAL_-_TWO_WIDTH_, 0) andText:str4 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_ andLines:0];
        CGFloat label5Float;
        if (_LINE_HEIGHT_>=contentLabel4.frame.size.height) {
            label5Float = _LINE_HEIGHT_;
        }else{
            label5Float = contentLabel4.frame.size.height;
        }
        UIImageView *boundaryImageView = [AKFastImageView imageViewWithFrame:CGRectMake(0, contentLabel4.frame.origin.y+label5Float+5, 320, 2) andImage:[UIImage imageNamed:@"divider.png"]];
        UIView *cellView = [AKFastView viewWithWithFrame:CGRectMake(0, 0, 320, contentLabel4.frame.origin.y+label5Float+7) andBackgroundColor:[UIColor clearColor]];
        [cellView addSubview:contentLabel1];
        [cellView addSubview:contentLabel1_1];
        [cellView addSubview:contentLabel2];
        [cellView addSubview:contentLabel3];
        [cellView addSubview:label4];
        [cellView addSubview:contentLabel4];
        [cellView addSubview:boundaryImageView];
        [cellArray addObject:cellView];
    }
    return [cellArray autorelease];
}
+(NSMutableArray*)productQueryCellViewWithArray:(NSArray*)aArray//产品查询
{
    NSMutableArray *cellArray = [[NSMutableArray alloc]init];
    for (NSDictionary *aDic in aArray) {
        NSString *str1 = [NSString stringWithFormat:@"产品编码：%@",[aDic objectForKey:@"pno"]];
        NSString *str1_1 = [NSString stringWithFormat:@"产品名称：%@",[aDic objectForKey:@"pname"]];
        NSString *str2 = [NSString stringWithFormat:@"产品规格：%@",[aDic objectForKey:@"pstyle"]];
        NSString *str2_1 = [NSString stringWithFormat:@"产品分类：%@",[aDic objectForKey:@"pclass"]];
        NSString *str3 = [NSString stringWithFormat:@"单价：%@",[aDic objectForKey:@"price"]];
        NSString *str3_1 = [NSString stringWithFormat:@"产品单位：%@",[aDic objectForKey:@"punit"]];
        NSString *str4 = [NSString stringWithFormat:@"产品条码：%@",[aDic objectForKey:@"pcode"]];
        UILabel *contentLabel1 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5, 135-_START_INTERVAL_, _LINE_HEIGHT_) andText:str1 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel1_1 = [AKFastLabel labelWithFrame:CGRectMake(150, 5, 165, _LINE_HEIGHT_) andText:str1_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel2 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+_LINE2_HEIGHT_, 165-_START_INTERVAL_, _LINE_HEIGHT_) andText:str2 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel2_1 = [AKFastLabel labelWithFrame:CGRectMake(175, 5+_LINE2_HEIGHT_, 140, _LINE_HEIGHT_) andText:str2_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel3 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+2*_LINE2_HEIGHT_, 155-_START_INTERVAL_, _LINE_HEIGHT_) andText:str3 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel3_1 = [AKFastLabel labelWithFrame:CGRectMake(170, 5+2*_LINE2_HEIGHT_, 315-170, _LINE_HEIGHT_) andText:str3_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel4 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+3*_LINE2_HEIGHT_, 315-_START_INTERVAL_, _LINE_HEIGHT_) andText:str4 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UIImageView *boundaryImageView = [AKFastImageView imageViewWithFrame:CGRectMake(0, contentLabel4.frame.origin.y+_LINE_HEIGHT_+5, 320, 2) andImage:[UIImage imageNamed:@"divider.png"]];
        UIView *cellView = [AKFastView viewWithWithFrame:CGRectMake(0, 0, 320, contentLabel4.frame.origin.y+_LINE_HEIGHT_+7) andBackgroundColor:[UIColor clearColor]];
        [cellView addSubview:contentLabel1];
        [cellView addSubview:contentLabel1_1];
        [cellView addSubview:contentLabel2];
        [cellView addSubview:contentLabel2_1];
        [cellView addSubview:contentLabel3];
        [cellView addSubview:contentLabel3_1];
        [cellView addSubview:contentLabel4];
        [cellView addSubview:boundaryImageView];
        [cellArray addObject:cellView];
    }
    return [cellArray autorelease];
}
+(NSMutableArray*)companyNoticeCellViewWithArray:(NSArray*)aArray//公司公告
{
    NSMutableArray *cellArray = [[NSMutableArray alloc]init];
    for (NSDictionary *aDic in aArray) {
        NSString *str1 = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"title"]];
        NSString *str2 = [NSString stringWithFormat:@"添加人：%@",[aDic objectForKey:@"operator"]];
        NSString *str2_1 = [NSString stringWithFormat:@"发布时间：%@",[aDic objectForKey:@"createtime"]];
        UILabel *contentLabel1 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5, 315-_START_INTERVAL_, 17) andText:str1 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_+2];
        UILabel *contentLabel2 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 25, 145-_START_INTERVAL_, _LINE_HEIGHT_) andText:str2 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_-1];
        UILabel *contentLabel2_1 = [AKFastLabel labelWithFrame:CGRectMake(155, 25, 160, _LINE_HEIGHT_) andText:str2_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_-1];
        UIImageView *boundaryImageView = [AKFastImageView imageViewWithFrame:CGRectMake(0, contentLabel2.frame.origin.y+_LINE_HEIGHT_+5, 320, 2) andImage:[UIImage imageNamed:@"divider.png"]];
        UIView *cellView = [AKFastView viewWithWithFrame:CGRectMake(0, 0, 320, contentLabel2.frame.origin.y+_LINE_HEIGHT_+7) andBackgroundColor:[UIColor clearColor]];
        [cellView addSubview:contentLabel1];
        [cellView addSubview:contentLabel2];
        [cellView addSubview:contentLabel2_1];
        [cellView addSubview:boundaryImageView];
        [cellArray addObject:cellView];
    }
    return [cellArray autorelease];
}
+(NSMutableArray*)CustomerChoiceCellViewWithArray:(NSArray*)aArray//客户选择
{
    NSMutableArray *cellArray = [[NSMutableArray alloc]init];
    for (NSDictionary *aDic in aArray) {
        NSString *str1 = [NSString stringWithFormat:@"客户编码：%@",[aDic objectForKey:@"customno"]];
        NSString *str2 = [NSString stringWithFormat:@"客户名称：%@",[aDic objectForKey:@"cname"]];
        NSString *str3 = [NSString stringWithFormat:@"联系人：%@  %@",[aDic objectForKey:@"linkMan"],[aDic objectForKey:@"mobile"]];
        NSString *str4 = [NSString stringWithFormat:@"%@",[aDic objectForKey:@"address"]];
        UILabel *contentLabel1 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5, 315-_START_INTERVAL_, _LINE_HEIGHT_) andText:str1 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel2 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+_LINE2_HEIGHT_, 315-_START_INTERVAL_, _LINE_HEIGHT_) andText:str2 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel3 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+2*_LINE2_HEIGHT_, 315-_START_INTERVAL_, _LINE_HEIGHT_) andText:str3 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *label4 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+3*_LINE2_HEIGHT_, _TWO_WIDTH_, _LINE_HEIGHT_) andText:@"地址：" andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel4 = [AKFastLabel cellLabelWithFrame:CGRectMake( _START_INTERVAL_+_TWO_WIDTH_, 5+3*_LINE2_HEIGHT_, 315-_START_INTERVAL_-_TWO_WIDTH_, 0) andText:str4 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_ andLines:0];
        CGFloat label5Float;
        if (_LINE_HEIGHT_>=contentLabel4.frame.size.height) {
            label5Float = _LINE_HEIGHT_;
        }else{
            label5Float = contentLabel4.frame.size.height;
        }
        UIImageView *boundaryImageView = [AKFastImageView imageViewWithFrame:CGRectMake(0, contentLabel4.frame.origin.y+label5Float+5, 320, 2) andImage:[UIImage imageNamed:@"divider.png"]];
        UIView *cellView = [AKFastView viewWithWithFrame:CGRectMake(0, 0, 320, contentLabel4.frame.origin.y+label5Float+7) andBackgroundColor:[UIColor clearColor]];
        [cellView addSubview:contentLabel1];
        [cellView addSubview:contentLabel2];
        [cellView addSubview:contentLabel3];
        [cellView addSubview:label4];
        [cellView addSubview:contentLabel4];
        [cellView addSubview:boundaryImageView];
        [cellArray addObject:cellView];
    }
    return [cellArray autorelease];
}
+(NSMutableArray*)ProductChoiceCellViewWithArray:(NSArray*)aArray//产品选择
{
    NSMutableArray *cellArray = [[NSMutableArray alloc]init];
    for (NSDictionary *aDic in aArray) {
        NSString *str1 = [NSString stringWithFormat:@"产品编码：%@",[aDic objectForKey:@"pno"]];
        NSString *str1_1 = [NSString stringWithFormat:@"产品名称：%@",[aDic objectForKey:@"pname"]];
        NSString *str2 = [NSString stringWithFormat:@"产品规格：%@",[aDic objectForKey:@"pstyle"]];
        NSString *str2_1 = [NSString stringWithFormat:@"产品分类：%@",[aDic objectForKey:@"pclass"]];
        UILabel *contentLabel1 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5, 135-_START_INTERVAL_, _LINE_HEIGHT_) andText:str1 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel1_1 = [AKFastLabel labelWithFrame:CGRectMake(150, 5, 165, _LINE_HEIGHT_) andText:str1_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UILabel *contentLabel2 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_, 5+_LINE2_HEIGHT_, 165-_START_INTERVAL_, _LINE_HEIGHT_) andText:str2 andtextAlignment:UITextAlignmentLeft andFont:_CELL_FONT_];
        UILabel *contentLabel2_1 = [AKFastLabel labelWithFrame:CGRectMake(175, 5+_LINE2_HEIGHT_, 140, _LINE_HEIGHT_) andText:str2_1 andtextAlignment:UITextAlignmentRight andFont:_CELL_FONT_];
        UIImageView *boundaryImageView = [AKFastImageView imageViewWithFrame:CGRectMake(0, contentLabel2.frame.origin.y+_LINE_HEIGHT_+5, 320, 2) andImage:[UIImage imageNamed:@"divider.png"]];
        UIView *cellView = [AKFastView viewWithWithFrame:CGRectMake(0, 0, 320, contentLabel2.frame.origin.y+_LINE_HEIGHT_+7) andBackgroundColor:[UIColor clearColor]];
        [cellView addSubview:contentLabel1];
        [cellView addSubview:contentLabel1_1];
        [cellView addSubview:contentLabel2];
        [cellView addSubview:contentLabel2_1];
        [cellView addSubview:boundaryImageView];
        [cellArray addObject:cellView];
    }
    return [cellArray autorelease];
}
+(NSMutableArray*)reportCellViewWithArray:(NSArray*)aArray andDeleteTouchUpTarget:(id)aTarget andDeleteTouchUpAction:(SEL)aAction//上报Cell
{
    NSMutableArray *cellArray = [[NSMutableArray alloc]init];
    int i = 100;
    for (NSDictionary *aDic in aArray) {
        NSString *str1 = [NSString stringWithFormat:@"产品编码：%@",[aDic objectForKey:@"pno"]];
        NSString *str1_1 = [NSString stringWithFormat:@"产品名称：%@",[aDic objectForKey:@"pname"]];
        NSString *str2 = [NSString stringWithFormat:@"产品规格：%@",[aDic objectForKey:@"pstyle"]];
        NSString *str2_1 = [NSString stringWithFormat:@"产品数量：%@",[aDic objectForKey:@"pnum"]];
        NSString *str3 = [NSString stringWithFormat:@"产品分类：%@",[aDic objectForKey:@"pclass"]];
        NSString *str3_1 = [NSString stringWithFormat:@"产品单价：%@",[aDic objectForKey:@"price"]];
        UILabel *contentLabel1 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_+30, 5, 145-_START_INTERVAL_-30, _LINE_HEIGHT_) andText:str1 andtextAlignment:UITextAlignmentLeft andFont:_MIN_CELL_FONT_];
        UILabel *contentLabel1_1 = [AKFastLabel labelWithFrame:CGRectMake(155, 5, 160, _LINE_HEIGHT_) andText:str1_1 andtextAlignment:UITextAlignmentRight andFont:_MIN_CELL_FONT_];
        UILabel *contentLabel2 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_+30, 5+_LINE2_HEIGHT_, 180-_START_INTERVAL_-30, _LINE_HEIGHT_) andText:str2 andtextAlignment:UITextAlignmentLeft andFont:_MIN_CELL_FONT_];
        UILabel *contentLabel2_1 = [AKFastLabel labelWithFrame:CGRectMake(190, 5+_LINE2_HEIGHT_, 125, _LINE_HEIGHT_) andText:str2_1 andtextAlignment:UITextAlignmentRight andFont:_MIN_CELL_FONT_];
        UILabel *contentLabel3 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_+30, 5+2*_LINE2_HEIGHT_, 165-_START_INTERVAL_-30, _LINE_HEIGHT_) andText:str3 andtextAlignment:UITextAlignmentLeft andFont:_MIN_CELL_FONT_];
        UILabel *contentLabel3_1 = [AKFastLabel labelWithFrame:CGRectMake(175, 5+2*_LINE2_HEIGHT_, 315-175, _LINE_HEIGHT_) andText:str3_1 andtextAlignment:UITextAlignmentRight andFont:_MIN_CELL_FONT_];
        UIImageView *boundaryImageView = [AKFastImageView imageViewWithFrame:CGRectMake(0, contentLabel3.frame.origin.y+_LINE_HEIGHT_+5, 320, 2) andImage:[UIImage imageNamed:@"divider.png"]];
        UIButton *deleteButton = [AKFastButton buttonWithType:UIButtonTypeCustom andFrame:CGRectMake(2, 15, 30, 20) andNormalTitle:@"删除" andBackgroundImage:[UIImage imageNamed:@"anniu.png"] andTouchUpTarget:aTarget andTouchUpAction:aAction andTag:i++];
        UIView *cellView = [AKFastView viewWithWithFrame:CGRectMake(0, 0, 320, contentLabel3.frame.origin.y+_LINE_HEIGHT_+7) andBackgroundColor:[UIColor clearColor]];
        cellView.userInteractionEnabled = YES;
        [cellView addSubview:deleteButton];
        [cellView addSubview:contentLabel1];
        [cellView addSubview:contentLabel1_1];
        [cellView addSubview:contentLabel2];
        [cellView addSubview:contentLabel2_1];
        [cellView addSubview:contentLabel3];
        [cellView addSubview:contentLabel3_1];
        [cellView addSubview:boundaryImageView];
        [cellArray addObject:cellView];
    }
    return [cellArray autorelease];
}
+(NSMutableArray*)adjustCargoReportCellViewWithArray:(NSArray*)aArray andDeleteTouchUpTarget:(id)aTarget andDeleteTouchUpAction:(SEL)aAction//上报Cell
{
    NSMutableArray *cellArray = [[NSMutableArray alloc]init];
    int i = 100;
    for (NSDictionary *aDic in aArray) {
        NSString *str1 = [NSString stringWithFormat:@"产品编码：%@",[aDic objectForKey:@"pno"]];
        NSString *str1_1 = [NSString stringWithFormat:@"产品名称：%@",[aDic objectForKey:@"pname"]];
        NSString *str2 = [NSString stringWithFormat:@"产品规格：%@",[aDic objectForKey:@"pstyle"]];
        NSString *str2_1 = [NSString stringWithFormat:@"调货数量：%@",[aDic objectForKey:@"pnum"]];
        NSString *str3 = [NSString stringWithFormat:@"调入单价：%@",[aDic objectForKey:@"iprice"]];
        NSString *str3_1 = [NSString stringWithFormat:@"调出单价：%@",[aDic objectForKey:@"oprice"]];
        UILabel *contentLabel1 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_+30, 5, 145-_START_INTERVAL_-30, _LINE_HEIGHT_) andText:str1 andtextAlignment:UITextAlignmentLeft andFont:_MIN_CELL_FONT_];
        UILabel *contentLabel1_1 = [AKFastLabel labelWithFrame:CGRectMake(155, 5, 160, _LINE_HEIGHT_) andText:str1_1 andtextAlignment:UITextAlignmentRight andFont:_MIN_CELL_FONT_];
        UILabel *contentLabel2 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_+30, 5+_LINE2_HEIGHT_, 180-_START_INTERVAL_-30, _LINE_HEIGHT_) andText:str2 andtextAlignment:UITextAlignmentLeft andFont:_MIN_CELL_FONT_];
        UILabel *contentLabel2_1 = [AKFastLabel labelWithFrame:CGRectMake(190, 5+_LINE2_HEIGHT_, 125, _LINE_HEIGHT_) andText:str2_1 andtextAlignment:UITextAlignmentRight andFont:_MIN_CELL_FONT_];
        UILabel *contentLabel3 = [AKFastLabel labelWithFrame:CGRectMake(_START_INTERVAL_+30, 5+2*_LINE2_HEIGHT_, 165-_START_INTERVAL_-30, _LINE_HEIGHT_) andText:str3 andtextAlignment:UITextAlignmentLeft andFont:_MIN_CELL_FONT_];
        UILabel *contentLabel3_1 = [AKFastLabel labelWithFrame:CGRectMake(175, 5+2*_LINE2_HEIGHT_, 315-175, _LINE_HEIGHT_) andText:str3_1 andtextAlignment:UITextAlignmentRight andFont:_MIN_CELL_FONT_];
        UIImageView *boundaryImageView = [AKFastImageView imageViewWithFrame:CGRectMake(0, contentLabel3.frame.origin.y+_LINE_HEIGHT_+5, 320, 2) andImage:[UIImage imageNamed:@"divider.png"]];
        UIButton *deleteButton = [AKFastButton buttonWithType:UIButtonTypeCustom andFrame:CGRectMake(2, 15, 30, 20) andNormalTitle:@"删除" andBackgroundImage:[UIImage imageNamed:@"anniu.png"] andTouchUpTarget:aTarget andTouchUpAction:aAction andTag:i++];
        UIView *cellView = [AKFastView viewWithWithFrame:CGRectMake(0, 0, 320, contentLabel3.frame.origin.y+_LINE_HEIGHT_+7) andBackgroundColor:[UIColor clearColor]];
        cellView.userInteractionEnabled = YES;
        [cellView addSubview:deleteButton];
        [cellView addSubview:contentLabel1];
        [cellView addSubview:contentLabel1_1];
        [cellView addSubview:contentLabel2];
        [cellView addSubview:contentLabel2_1];
        [cellView addSubview:contentLabel3];
        [cellView addSubview:contentLabel3_1];
        [cellView addSubview:boundaryImageView];
        [cellArray addObject:cellView];
    }
    return [cellArray autorelease];
}
@end
