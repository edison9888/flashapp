//
//  HelpListViewController.m
//  flashapp
//
//  Created by Qi Zhao on 12-7-15.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import "HelpListViewController.h"
#import "HelpNetBadViewController.h"
#import "HelpMMSViewController.h"
#import "HelpDataStatsViewController.h"
#import "LevelViewController.h"
#import "HelpViewController.h"
#import "HelpCompressViewController.h"
#import "HelpLockAppViewController.h"
#import "UIDevice-Reachability.h"
#import "AppDelegate.h"


#define TAG_CELL_LABEL 101


@interface HelpListViewController ()

@end

@implementation HelpListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"诊断与帮助";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:nil];
    
    //去掉表中的分割线
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:40.0/255.0 green:40.0/255.0 blue:40.0/255.0 alpha:1.0];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}


- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    if ( row == 0 ) {
        return 39;
    }
    else if ( row == 7 ) {
        return 44;
    }
    else {
        return 40;
    }
}


- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    view.backgroundColor = self.tableView.backgroundColor;
    return view;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( cell == nil ) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake( 290, 13, 10, 14)];
        imageView.image = [UIImage imageNamed:@"left_arrow2.png"];
        [cell.contentView addSubview:imageView];
        [imageView release];
        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 14, 12, 12)];
        imageView.image = [UIImage imageNamed:@"help_prismatic.png"];
        [cell.contentView addSubview:imageView];
        [imageView release];

        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(42, 10, 260, 20)];
        label.tag = TAG_CELL_LABEL;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:16];
        [cell.contentView addSubview:label];
        [label release];
    }
    
    cell.backgroundView = [self tableView:tableView viewForCellBackground:indexPath];
    cell.selectedBackgroundView = [self tableView:tableView viewForCellSelectedBackground:indexPath];
    
    int row = indexPath.row;
    UILabel * label = (UILabel*) [cell.contentView viewWithTag:TAG_CELL_LABEL];
    switch (row) {
        case 0:
            label.text = @"无法使用网络怎么办？";
            break;
        case 1:
            label.text = @"网速慢？";
            break;
        case 2:
            label.text = @"没有压缩？";
            break;
        case 3:
            label.text = @"无法发送彩信？";
            break;
        case 4:
            label.text = @"数据统计有问题？";
            break;
        case 5:
            label.text = @"什么是锁网功能？";
            break;
        case 6:
            label.text = @"如何增加节省额度？";
            break;
        case 7:
            label.text = @"其他帮助";
            break;
        default:
            break;
    }
    
    return cell;
}


- (UIView*) tableView:(UITableView *)tableView viewForCellBackground:(NSIndexPath*)indexPath
{
    int row = indexPath.row;
    CGFloat height = [self tableView:tableView heightForRowAtIndexPath:indexPath];
    UIView* view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, height)] autorelease];
    
    UIImageView* imageView;
    if ( row == 0 ) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 300, 39)];
        imageView.image = [[UIImage imageNamed:@"help_cell_bg_top.png"] stretchableImageWithLeftCapWidth:13 topCapHeight:0];
    }
    else if ( row == 7 ) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 300, 44)];
        imageView.image = [[UIImage imageNamed:@"help_cell_bg_bottom.png"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    }
    else {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 300, 40)];
        imageView.image = [[UIImage imageNamed:@"help_cell_bg_middle.png"] stretchableImageWithLeftCapWidth:3 topCapHeight:4];
    }
    
    [view addSubview:imageView];
    [imageView release];
    
    return view;
}



- (UIView*) tableView:(UITableView *)tableView viewForCellSelectedBackground:(NSIndexPath*)indexPath
{
    int row = indexPath.row;
    CGFloat height = [self tableView:tableView heightForRowAtIndexPath:indexPath];
    UIView* view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, height)] autorelease];
    
    UIImageView* imageView;
    if ( row == 0 ) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 300, 39)];
        imageView.image = [[UIImage imageNamed:@"help_cell_bg_top_h.png"] stretchableImageWithLeftCapWidth:13 topCapHeight:0];
    }
    else if ( row == 7 ) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 300, 44)];
        imageView.image = [[UIImage imageNamed:@"help_cell_bg_bottom_h.png"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    }
    else {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 300, 40)];
        imageView.image = [[UIImage imageNamed:@"help_cell_bg_middle_h.png"] stretchableImageWithLeftCapWidth:3 topCapHeight:4];
    }
    
    [view addSubview:imageView];
    [imageView release];
    
    return view;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (NSIndexPath*) tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    ConnectionType type = [UIDevice connectionType]; 
    
    if ( row == 0 ) {
        if ( type != CELL_2G && type != CELL_3G && type != CELL_4G ) {
            [self alertWIFIConnection];
        }
        else {
            HelpNetBadViewController* controller = [[HelpNetBadViewController alloc] init];
            controller.checkType = CONN_CHECK_BAD;
            [self.navigationController pushViewController:controller animated:YES];
            [controller release];
        }
    }
    else if ( row == 1 ) {
        if ( type != CELL_2G && type != CELL_3G && type != CELL_4G ) {
            [self alertWIFIConnection];
        }
        else {
            HelpNetBadViewController* controller = [[HelpNetBadViewController alloc] init];
            controller.checkType = CONN_CHECK_SLOW;
            [self.navigationController pushViewController:controller animated:YES];
            [controller release];
        }
    }
    else if ( row == 2 ) {
        //无法压缩
        if ( type != CELL_2G && type != CELL_3G && type != CELL_4G ) {
            [self alertWIFIConnection];
        }
        else {
            HelpCompressViewController* controller = [[HelpCompressViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
            [controller release];
        }
    }
    else if ( row == 3 ) {
        //无法发送彩信
        HelpMMSViewController* controller = [[HelpMMSViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
        [controller release];
    }
    else if ( row == 4 ) {
        //数据统计有问题？
        HelpDatastatsViewController* controller = [[HelpDatastatsViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
        [controller release];
    }
    else if ( row == 5 ) {
        HelpLockAppViewController* controller = [[HelpLockAppViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
        [controller release];
    }
    else if ( row == 6 ) {
        //如何增加节省额度
        LevelViewController* controller = [[LevelViewController alloc] init];
        controller.showCloseButton = NO;
        controller.title = @"诊断与帮助";
        [self.navigationController pushViewController:controller animated:YES];
        [controller release];
    }
    else if ( row == 7 ) {
        //其他帮助
        HelpViewController* controller = [[HelpViewController alloc] init];
        controller.showCloseButton = NO;
        [self.navigationController pushViewController:controller animated:YES];
        [controller release];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


- (void) alertWIFIConnection
{
    [AppDelegate showAlert:@"无法上网怎么办?" message:@"请关闭WIFI来获取最佳的诊断效果。"];
}


@end
