//
//  GCDSketch.m
//  block小节
//
//  Created by JHW on 17/3/20.
//  Copyright © 2017年 JHW. All rights reserved.
//

#import "GCDSketch.h"

@implementation GCDSketch

-(instancetype)init{

    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)loadGCD{
    /**
     *  创建队列
     *
     *  @param ""                        参数为queue的名称，命名规则为FQDN，应用名称ID的倒序+queue名字
     *  @param DISPATCH_QUEUE_CONCURRENT 参数为Null创建Serial dispatch queue；如果为DISPATCH_QUEUE_CONCURRENT则创建的是Concurrent queue
     *
     *  @return queue
     */
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    //async 追加
    dispatch_async(concurrentQueue, ^{
        //不等待执行中处理结束
    });
    
    dispatch_queue_t serialQueue = dispatch_queue_create("com.serialQueue",DISPATCH_QUEUE_SERIAL);
    dispatch_async(serialQueue, ^{
       //等待执行中处理结束
    });

//****************************************************************************************************
    //获取系统标准提供的Dispatch Queue
    
    //1、Main Dispatch Queue是Serial Dispatch Queue(因为主线程只有一个)
    dispatch_async(dispatch_get_main_queue(), ^{
        //主线程操作
        //例如用户界面更新等一些必须在主线程执行的处理追加到Main Dispatch Queue
    });
    //2、Global Dispatch Queue是所有应用都能使用的Concurrent Dispatch Queue。没必要通过dispatch_queue_creat函数逐个生成Concurrent Dispatch Queue。只要获取即可。      Global Dispatch Queue有四个优先级，分别是高优先级（High Priority）、默认优先级（Default Priority）、低优先级（Low Priority）和后台优先级（Background Priority）。通过XNU内核管理的用于Global Dispatch Queue的线程，将各自使用的Global Dispatch Queue 的执行优先级作为线程的执行优先级使用。      但是通过XNU内核用于Global Dispatch Queue的线程并不能保证实时性，因此执行优先级只是大致判断。
    
    /*   Dispatch Queue的种类
     ————————————————————————————————————————————————————————————————————————————————————————————————————
     |名称                                        |Dispatch Queue的种类     |说明
     ————————————————————————————————————————————————————————————————————————————————————————————————————
     |Main Dispatch Queue                        |Main Dispatch Queue     |主线程执行
     ————————————————————————————————————————————————————————————————————————————————————————————————————
     |Global Dispatch Queue（High Priority）      |Global Dispatch Queue   |执行优先级：（高）（最高优先）
     ————————————————————————————————————————————————————————————————————————————————————————————————————
     |Global Dispatch Queue（Default Priority）   |Global Dispatch Queue   |执行优先级：默认
     ————————————————————————————————————————————————————————————————————————————————————————————————————
     |Global Dispatch Queue（Low Priority）       |Global Dispatch Queue   |执行优先级：低
     ————————————————————————————————————————————————————————————————————————————————————————————————————
     |Global Dispatch Queue（Background Priority）|Global Dispatch Queue   |执行优先级：后台
     ————————————————————————————————————————————————————————————————————————————————————————————————————
     */
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    });

//****************************************************************************************************
    //dispatch_set_target_queue
    //变更生成的Dispatch Queue的执行优先级要用dispatch_set_target_queue函数

//****************************************************************************************************
    //dispatch_after延迟处理
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3ull * NSEC_PER_SEC);
    /**
     *  延迟操作
     *
     *  @param time                    指定时间用的dispatch_time_t类型的值，该值使用dispatch_time函数或dispatch_walltime函数制成       dispatch_time函数通常用于计算相对时间，而dispatch_walltime函数用于计算绝对时间
     *  @param dispatch_get_main_queue 指定要追加处理的Dispatch Queue，第三个参数指定记述要执行处理的Block。
     *
     *  @return
     */
    dispatch_after(time, dispatch_get_main_queue(), ^{
        
    });
    
//****************************************************************************************************
    //Dispatch Group
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk0");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk1");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"blk2");
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"done");
    });
    //执行结果 blk1 blk2 blk0 done 因为向Global Dispatch Queue即Concurrent Dispatch Queue追加处理，多个线程并行执行，所以追加处理的执行顺序不定，执行时会发生变化，但是此执行结果的done 一定是最后输出
    
//****************************************************************************************************
    //dispatch_barrier_async
    //dispatch_barrier_async函数会等待追加到Concurrent Dispatch Queue上的并行执行的处理全部结束之后，再将指定的处理追加到该Concurrent Dispatch Queue中，然后在由dispatch_barrier_async函数追加的处理执行完毕后，Concurrent Dispatch Queue才恢复一般动作，追加到Concurrent Dispatch Queue的处理又开始执行      使用Concurrent Dispatch Queue和dispatch_barrier_async函数可实现高效率的数据库访问和文件访问
    
//****************************************************************************************************
    //dispatch_sync
    //dispatch_async函数的“async”意味着“非同步”（asynchronous），就是将指定的Block“非同步”地追加到指定的Dispatch Queue中。dispatch_async函数不做任何等待
    //对应的dispatch_sync函数的“sync”意味着“同步”（synchronous），也就是指定的Block“同步”追加到指定的Dispatch Queue中。在追加Block结束之前，dispatch_sync函数会一直等待

//****************************************************************************************************
    //dispatch_apply
    //dispatch_apply函数是dispatch_sync函数和Dispatch Group的关联API。该函数按指定的次数将指定的Block追加到指定的Dispatch Queue中，并等待全部处理之行结束
    
    dispatch_queue_t queueapply = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    /**
     *
     *
     *  @param 10         重复次数
     *  @param queueapply 追加对象的Dispatch Queue
     *  @param index      为追加的处理
     *
     *  @return
     */
    dispatch_apply(10, queueapply, ^(size_t index) {
        NSLog(@"apply-----%zu",index);
    });
    NSLog(@"apply-----done");
    
//****************************************************************************************************
    //dispatch_suspend/dispatch_resume
    /*当追加大量处理到Dispatch Queue时，在追加处理的过程中，有时希望不执行已追加的处理。例如验算结果被Block截获时，一些处理会对这个演算结果造成影响     
     在这种情况下，只要挂起Dispatch Queue即可，当可以执行再恢复
     dispatch_suspend函数挂起指定的Dispatch Queue。
     dispatch_resume函数恢复指定的Dispatch Queue
     这些函数对已经执行的处理没有影响。挂起后，追加到Dispatch Queue中但尚未执行的处理在此之后停止执行。而恢复则使得这些处理能够继续执行
    */
//****************************************************************************************************
    //dispatch_once
}

@end























