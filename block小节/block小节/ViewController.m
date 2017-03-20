//
//  ViewController.m
//  block小节
//
//  Created by JHW on 17/3/17.
//  Copyright © 2017年 JHW. All rights reserved.
//

#import "ViewController.h"
#import "GCDViewController.h"

#import "BlockGrammar.h"
#import "BlockVariableType.h"
#import "BlockVariable.h"
#import "__BlockSpecifier.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *typeBtn;
@property (weak, nonatomic) IBOutlet UIButton *variableBtn;
@property (weak, nonatomic) IBOutlet UIButton *specifierBtn;
@property (weak, nonatomic) IBOutlet UIButton *grammarBtn;
@property (weak, nonatomic) IBOutlet UIButton *gcdBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //block模式
    [self loadPattern];
    
    __weak typeof(self)weakSelf = self;
    [[_gcdBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        GCDViewController *vc = [[GCDViewController alloc]init];
        [weakSelf presentViewController:vc animated:YES completion:^{
            
        }];
    }];
    
}
#pragma mark - block模式
- (void)loadPattern{
    
    //block语法
    [[_grammarBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        BlockGrammar *grammar = [[BlockGrammar alloc]init];
        [grammar loadBlockGrammar];
    }];
    //block类型变量
    [[_typeBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        BlockVariableType *type = [[BlockVariableType alloc]init];
        [type loadBlockVariableTypeBlock:^int(int count) {
            return count;
        }];
    }];
    //block带有自动变量
    [[_variableBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        BlockVariable *variable = [[BlockVariable alloc]init];
        [variable loadBlockVariable];
    }];
    //__block标识符
    [[_specifierBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        __BlockSpecifier *specifier = [[__BlockSpecifier alloc]init];
        [specifier loadBlockSpecifier];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
































