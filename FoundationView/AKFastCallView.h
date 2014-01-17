//
//  AKFastCallView.h
//  农化通
//
//  Created by 凯_SKK on 13-3-5.
//  Copyright (c) 2013年 山东乐世安通通信技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKFastCallView : NSObject
+(NSMutableArray*)indentRecordCellViewWithArray:(NSArray*)aArray;//订单记录
+(NSMutableArray*)adjustCargoRecordCellViewWithArray:(NSArray*)aArray;//调货记录
+(NSMutableArray*)sendCargoRecordCellViewWithArray:(NSArray*)aArray;//退货记录
+(NSMutableArray*)activityRecordCellViewWithArray:(NSArray*)aArray;//活动记录
+(NSMutableArray*)specimenRecordCellViewWithArray:(NSArray*)aArray;//样品记录
+(NSMutableArray*)dailyRecordCellViewWithArray:(NSArray*)aArray;//日报记录
+(NSMutableArray*)photoRecordCellViewWithArray:(NSArray*)aArray;//照片回传
+(NSMutableArray*)productQueryCellViewWithArray:(NSArray*)aArray;//产品查询
+(NSMutableArray*)CustomerChoiceCellViewWithArray:(NSArray*)aArray;//客户选择
+(NSMutableArray*)ProductChoiceCellViewWithArray:(NSArray*)aArray;//产品选择
+(NSMutableArray*)companyNoticeCellViewWithArray:(NSArray*)aArray;//公司公告
+(NSMutableArray*)reportCellViewWithArray:(NSArray*)aArray andDeleteTouchUpTarget:(id)aTarget andDeleteTouchUpAction:(SEL)aAction;//上报Cell
+(NSMutableArray*)adjustCargoReportCellViewWithArray:(NSArray*)aArray andDeleteTouchUpTarget:(id)aTarget andDeleteTouchUpAction:(SEL)aAction;//调货上报Cell
@end
