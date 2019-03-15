//
//  CountriesTableViewController.m
//  BottomSheetDemo
//
//  Created by Admin on 2019/3/14.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "CountriesTableViewController.h"
static CGFloat maxVisibleContentHeight = 400;
static int     numberOfCountries       = 20;
static NSString *reuseIdentifier       = @"cell";


@interface CountriesTableViewController ()

@end

@implementation CountriesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIEdgeInsets edgeInsets =  self.tableView.contentInset;
    edgeInsets.top = maxVisibleContentHeight;
    self.tableView.contentInset = edgeInsets;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.decelerationRate = UIScrollViewDecelerationRateFast;
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [self.changeSubject sendNext:[NSString stringWithFormat:@"%f",self.tableView.contentOffset.y]];
    
    if (self.tableView.contentSize.height < self.tableView.bounds.size.height) {
        CGSize contentSize = self.tableView.contentSize;
        contentSize.height = self.tableView.bounds.size.height;
        self.tableView.contentSize = contentSize;
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return numberOfCountries;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell== nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    CGFloat targetOffset = targetContentOffset->y;
    CGFloat pulledUpOffset = 0;
    CGFloat pulledDownOffset = -maxVisibleContentHeight;
    if (targetOffset > pulledDownOffset && targetOffset < pulledUpOffset) {
        if (velocity.y < 0) {
            targetContentOffset->y = pulledDownOffset;
        }else{
            targetContentOffset->y = pulledUpOffset;
        }
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击cell：%ld",(long)indexPath.row);
    [self.didSelectSubject sendNext:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
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
