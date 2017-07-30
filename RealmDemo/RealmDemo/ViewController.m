//
//  ViewController.m
//  RealmDemo
//
//  Created by Hony on 2017/7/28.
//  Copyright © 2017年 Hony. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Dog.h"
#import <Realm/Realm.h>
#import <Security/Security.h>

@interface ViewController ()

@property (nonatomic,strong) RLMNotificationToken *token1;
@property (nonatomic,strong) RLMNotificationToken *resultToken;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // realm 数据库路径
//    [RLMRealmConfiguration defaultConfiguration].fileURL
    
    // 好文链接：http://www.jianshu.com/p/50e0efb66bdf
    NSLog(@"%@", NSHomeDirectory());
}



/**
 添加
 */
- (IBAction)add:(id)sender {
    
    Person *person = [[Person alloc]initWithValue:@[@"Hony",@22]];
    RLMRealm *rlm = [RLMRealm defaultRealm];
    
    // realm 的数据操作要在事务中
    [rlm transactionWithBlock:^{
        [rlm addObject:person];
    }];
    
    [rlm beginWriteTransaction];
    [rlm addObject:person];
    [rlm commitWriteTransaction];
    
    // GCD ->  ASYNC + SERIERAL 异步串行队列
//    如果在进程中存在多个写入操作的话，那么单个写入操作将会阻塞其余的写入操作，并且还会锁定该操作所在的当前线程。
    
    /**
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm addObject: Car];
        }];
    }); */
    
    /*
     * 当有主键的情况下，有以下几个非常好用的API
    addOrUpdateObject会去先查找有没有传入的Person相同的主键，如果有，就更新该条数据。这里需要注意，addOrUpdateObject这个方法不是增量更新，所有的值都必须有，如果有哪几个值是null，那么就会覆盖原来已经有的值，这样就会出现数据丢失的问题。
    
    createOrUpdateInRealm：withValue：这个方法是增量更新的，后面传一个字典，使用这个方法的前提是有主键。方法会先去主键里面找有没有字典里面传入的主键的记录，如果有，就只更新字典里面的子集。如果没有，就新建一条记录。 */
    
    
    /**
    [rlm addOrUpdateObject:person];
    [Person createInRealm:rlm withValue:@[@"Rose",@23]];
     */
}

/**
 删除
 */
- (IBAction)delete:(id)sender {
    
    RLMResults<Person *> *persons = [Person objectsWhere:@"name = '江南'"];
    if (persons.count > 0) {
        Person *jnperson = persons.firstObject;
        RLMRealm *rlm = [RLMRealm defaultRealm];
        // realm 的数据操作要在事务中
        [rlm transactionWithBlock:^{
            [rlm deleteObject:jnperson];
        }];
    }
}

/**
 修改
 */
- (IBAction)update:(id)sender {
    
    Person *firstP = [Person allObjects].firstObject;
    RLMRealm *rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        firstP.name = @"江南";
    }];
}

/**
 查询
 */
- (IBAction)query:(id)sender {
    
    /*
    在Realm中所有的查询（包括查询和属性访问）在 Realm 中都是延迟加载的，只有当属性被访问时，才能够读取相应的数据。
    
    查询结果并不是数据的拷贝：修改查询结果（在写入事务中）会直接修改硬盘上的数据。同样地，您可以直接通过包含在RLMResults中的RLMObject对象完成遍历关系图的操作。除非查询结果被使用，否则检索的执行将会被推迟。这意味着链接几个不同的临时 {RLMResults} 来进行排序和匹配数据，不会执行额外的工作，例如处理中间状态。
    一旦检索执行之后，或者通知模块被添加之后， RLMResults将随时保持更新，接收 Realm 中，在后台线程上执行的检索操作中可能所做的更改。
     */
    
     // Realm 采用了 zero-copy 架构，这样几乎就没有内存开销。这是因为每一个 Realm 对象直接通过一个本地 long 指针和底层数据库对应，这个指针是数据库中数据的钩子。
    // 注意，这一行中，所有的person对象还没有载入内存了。只有用到的视乎才会加载到内存中
    RLMResults<Person *> *persons =  [Person allObjects];
    for (Person *p in persons) {
        NSLog(@"name = %@",p.name);
    }

    // name CONTAINS ‘Ja’
    // == <= < > != BETWEEN CONTAINS ENDSWITH AND OR
    // 谓词操作
//    [Person objectsWithPredicate:<#(nullable NSPredicate *)#>]
//    [Person objectsInRealm:<#(nonnull RLMRealm *)#> where:<#(nonnull NSString *), ...#>]

    // 查主键
//    [Person objectInRealm:<#(nonnull RLMRealm *)#> forPrimaryKey:<#(nullable id)#>]
}


/**
 一对一
 */
- (IBAction)p2p:(id)sender {
    Person *p = [[Person alloc]init];
    p.name = @"唐伯虎";
    p.age = 18;
    
    Dog *wangcai = [[Dog alloc]init];
    wangcai.name = @"旺财";
    wangcai.isFemail = NO;
    
    p.dog = wangcai;
    
    RLMRealm *rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        [rlm addObject:p];
    }];
}



/**
 一对多
 */
- (IBAction)one2More:(id)sender {
    
    Person *p = [[Person alloc]init];
    p.name = @"唐伯虎";
    p.age = 18;
    
    Dog *wangcai = [[Dog alloc]init];
    wangcai.name = @"旺财";
    wangcai.isFemail = NO;
    
    Dog *xiaoqiang = [[Dog alloc]init];
    xiaoqiang.name = @"小强";
    xiaoqiang.isFemail = YES;
    
    p.dog = wangcai;
    [p.dogs addObject:wangcai];
    [p.dogs addObject:xiaoqiang];
    
    
    RLMRealm *rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        [rlm addObject:p];
    }];
}

/**
 反向
 */
- (IBAction)back:(id)sender {
    
    Person *p = [[Person alloc]init];
    p.name = @"唐伯虎";
    p.age = 18;
    
    Dog *wangcai = [[Dog alloc]init];
    wangcai.name = @"旺财";
    wangcai.isFemail = NO;
    
    Dog *xiaoqiang = [[Dog alloc]init];
    xiaoqiang.name = @"小强";
    xiaoqiang.isFemail = YES;
    
    p.dog = wangcai;
    [p.dogs addObject:wangcai];
    [p.dogs addObject:xiaoqiang];
    
    
    RLMRealm *rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        [rlm addObject:p];
    }];
    
    RLMResults *results = [Dog objectsWhere:@"name = '冠希'"];
    if (results.count) {
        Dog *firstDog = results.firstObject;
        // 只要有这个依赖冠希，就能获得这只狗的owners
        NSLog(@"------%@-----",firstDog.owners);
    }
    
    //会删除数据库中所有的模型
//    [rlm deleteAllObjects];
}



/**
 key-value 操作
 */
-(void)kvOperate{
    
    RLMResults<Person *> *persons = [Person allObjects];
    if (persons.count) {
        [[RLMRealm defaultRealm] transactionWithBlock:^{
            [[persons firstObject] setValue:@"里昂" forKeyPath:@"name"];
        }];
    }
}


/**
 监听数据库的改变
 */
-(void)notification{
    // 可以监听某个结果集  某个对象  或者整个数据库的改变的改变
    RLMRealm *rlm = [RLMRealm defaultRealm];
    self.token1 = [rlm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
        // 数据库修改了 ...
    }];
    
    // 停止监听数据库的修改
    [self.token1 stop];
    
    
    // 结果集被修改
    RLMResults *results = [Dog objectsWhere:@"name = '冠希'"];
    self.resultToken = [results addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
        // 结果集修改 。内容存在RLMCollectionChange对象里
    }];
    
    
    // 单个对象修改监听
    if (results.firstObject) {
        Dog *dog = (Dog *)results.firstObject;
        [dog addNotificationBlock:^(BOOL deleted, NSArray<RLMPropertyChange *> * _Nullable changes, NSError * _Nullable error) {
            // ...
        }];
    }
}


/// 数据库迁移
-(void)migration{
    
    // 所有的上诉局迁移操作都在RLMMigration 这个类中执行
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.schemaVersion = 2;
    config.migrationBlock = ^(RLMMigration *migration, uint64_t oldSchemaVersion)
    {
        // enumerateObjects:block: 遍历了存储在 Realm 文件中的每一个“Person”对象
        [migration enumerateObjects:Person.className block:^(RLMObject *oldObject, RLMObject *newObject) {
            
            // 各个不同版本的迁移
            // 只有当 Realm 数据库的架构版本为 0 的时候，才添加 “fullName” 属性
            if (oldSchemaVersion < 1) {
                newObject[@"fullName"] = [NSString stringWithFormat:@"%@ %@", oldObject[@"firstName"], oldObject[@"lastName"]];
            }
            // 只有当 Realm 数据库的架构版本为 0 或者 1 的时候，才添加“email”属性
            if (oldSchemaVersion < 2) {
                newObject[@"email"] = @"";
            }
            // 替换属性名
            if (oldSchemaVersion < 3) { // 重命名操作应该在调用 `enumerateObjects:` 之外完成
                [migration renamePropertyForClass:Person.className oldName:@"yearsSinceBirth" newName:@"age"]; }
        }];
    };
    [RLMRealmConfiguration setDefaultConfiguration:config];
    // 现在我们已经成功更新了架构版本并且提供了迁移闭包，打开旧有的 Realm 数据库会自动执行此数据迁移，然后成功进行访问
    [RLMRealm defaultRealm];
}


/**
 多线程注意
 */
-(void)threadSafe{
    // Terminating app due to uncaught exception 'RLMException', reason: 'Realm accessed from incorrect thread.
    
    // 如果程序崩溃了，出现以上错误，那就是因为你访问Realm数据的时候，使用的Realm对象所在的线程和当前线程不一致。
    // 解决办法就是在当前线程重新获取最新的Realm
    
    // realm 事务之间不能嵌套
    
}


/**
 数据库加密
 */
-(void)randomKey{
    // 产生随机密钥
    NSMutableData *key = [NSMutableData dataWithLength:64];
    SecRandomCopyBytes(kSecRandomDefault, key.length, (uint8_t *)key.mutableBytes);
    
    // 打开加密文件
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.encryptionKey = key;
    NSError *error = nil;
    RLMRealm *realm = [RLMRealm realmWithConfiguration:config error:&error];
    if (!realm) {
        // 如果密钥错误，`error` 会提示数据库不可访问
        NSLog(@"Error opening realm: %@", error);
    }
    
}
@end
