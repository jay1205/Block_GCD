//
//  BlockGrammar.m
//  block小节
//
//  Created by JHW on 17/3/17.
//  Copyright © 2017年 JHW. All rights reserved.
//

#import "BlockGrammar.h"

@implementation BlockGrammar

-(instancetype)init{

    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)loadBlockGrammar{

    //block 表达式
    [self loadBlock1];
    [self loadBlock2];
    [self loadBlock3];
}
#pragma mark - block语法
- (void)loadBlock1{
    
    //block表达式  返回值类型 参数列表 表达式
    int (^blk)(int) = ^int(int count){
        return count +1;
    };
    //调用
    int i = blk(1);
    NSLog(@"block1-----%d",i);
}
- (void)loadBlock2{
    
    //block表达式  （返回值类型）省略 参数列表 表达式
    int (^blk)(int) = ^(int count){
        
        return count +1;
    };
    //调用
    int i = blk(1);
    NSLog(@"block2-----%d",i);
}
- (void)loadBlock3{
    //block表达式  （返回值类型）省略 参数列表 表达式
    void (^blk)()= ^{
        
        NSLog(@"block3----%@",@"block3");
    };
    blk();
}

@end
