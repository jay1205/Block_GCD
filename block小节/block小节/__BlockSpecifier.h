//
//  __BlockSpecifier.h
//  block小节
//
//  Created by JHW on 17/3/17.
//  Copyright © 2017年 JHW. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  由于自动变量值保存后不能改写，所以就有了__block标识符，改写截获的自动变量
 */
@interface __BlockSpecifier : NSObject

- (void)loadBlockSpecifier;
@end
