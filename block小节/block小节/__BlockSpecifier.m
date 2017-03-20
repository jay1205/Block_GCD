//
//  __BlockSpecifier.m
//  block小节
//
//  Created by JHW on 17/3/17.
//  Copyright © 2017年 JHW. All rights reserved.
//

#import "__BlockSpecifier.h"

@implementation __BlockSpecifier

-(instancetype)init{
    self = [super init];
    if (self) {
    
    }
    return self;
}
- (void)loadBlockSpecifier{

    __block int val = 10;
    
    void (^blk)(void) = ^{
        val = 8;
        NSLog(@"blkVal-----%d",val);
    };
    
    val = 2;
    
    blk();
    
}
@end
