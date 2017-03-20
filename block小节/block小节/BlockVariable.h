//
//  BlockVariable.h
//  block小节
//
//  Created by JHW on 17/3/17.
//  Copyright © 2017年 JHW. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  block是带有自动变量值的匿名函数，“带有自动变量值”可解释为“截获自动变量值”,因此这些值被保存（即被截获），从而在执行块时使用
 *  自动变量值截获只能保存执行Block语法瞬间的值，保存后就不能改写该值
 */

/** block自动变量值 */
@interface BlockVariable : NSObject

- (void)loadBlockVariable;
@end
