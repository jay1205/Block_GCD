//
//  BlockVariableType.h
//  block小节
//
//  Created by JHW on 17/3/17.
//  Copyright © 2017年 JHW. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  在函数参数和返回值中使用Block类型变量时,记述方式极为复杂。这是我们可以像使用函数指针类型时那样，使用typedef来解决问题
 */
typedef int(^Blk) (int count);

/** block 类型变量 */
@interface BlockVariableType : NSObject
/**
 *  block类型变量
 *
 *  @param blk block类型变量
 */
- (void)loadBlockVariableTypeBlock:(Blk)blk;
@end
