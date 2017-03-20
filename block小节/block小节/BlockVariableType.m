//
//  BlockVariableType.m
//  block小节
//
//  Created by JHW on 17/3/17.
//  Copyright © 2017年 JHW. All rights reserved.
//

#import "BlockVariableType.h"

@interface BlockVariableType()
@end
@implementation BlockVariableType

-(instancetype)init{

    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)loadBlockVariableTypeBlock:(Blk)blk{

    int result = blk(10);
    NSLog(@"Blk-----%d",result);
}

@end
