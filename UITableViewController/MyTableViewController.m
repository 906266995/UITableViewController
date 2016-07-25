//
//  MyTableViewController.m
//  UITableViewController
//
//  Created by SXJ on 16/5/10.
//  Copyright © 2016年 SXJ. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UITableViewController
    //这个类 继承与UIViewController 就是一个特殊的UIViewController，它上面自带了一个tableView，并且已经注册了2个协议。
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    //属性refreshControl  UIRefreshControl类型继承与UIControl
    //tableView 刷新的那个小圆圈  设置大小无效
    self.refreshControl = [[UIRefreshControl alloc]init];
    //颜色
    self.refreshControl.tintColor = [UIColor redColor];
    self.refreshControl.attributedTitle =[[NSAttributedString alloc]initWithString:@"开始刷新"];
    NSLog(@"%d",self.refreshControl.refreshing);
    
    
    //添加事件  注意：forControlEvents
    [self.refreshControl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    
}
- (void)change:(UIRefreshControl *)sender{
    NSLog(@"%d",self.refreshControl.refreshing);
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"正在刷新"];
    //输出 此时是那个类的对象在调用哪个方法。
    NSLog(@"%s",__FUNCTION__);
    //延时调用
    [self performSelector:@selector(stopRefresh) withObject:self afterDelay:3];
    
}
- (void)stopRefresh{
    //停止刷新
    [self.refreshControl endRefreshing];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"开始刷新"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行",indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
