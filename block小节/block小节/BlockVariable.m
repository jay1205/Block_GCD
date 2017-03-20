//
//  BlockVariable.m
//  block小节
//
//  Created by JHW on 17/3/17.
//  Copyright © 2017年 JHW. All rights reserved.
//

#import "BlockVariable.h"

@implementation BlockVariable

-(instancetype)init{

    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)loadBlockVariable{

    int val = 10;
    //变量自动拦截
    void (^blk)(void) = ^{
        NSLog(@"blkVal-----%d",val);
    };
    
    val = 2;
    //block调用
    blk();
    
}
@end
