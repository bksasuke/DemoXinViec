//
//  SidebarViewController.m
//  SidebarDemo
//
//  Created by Simon on 29/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//
#import "SubMenu1.h"
#import "SidebarViewController.h"

@interface SidebarViewController ()

@property (nonatomic, strong) NSArray *menuItems;
@end

@implementation SidebarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.menuItems = @[@"canhan", @"chude", @"vietnam", @"quocte", @"hoatau", @"photo", @"bookmark", @"tag"];
    
    self.navigationItem.title = @"Menu";
    
  }


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [self.menuItems objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[_menuItems objectAtIndex:indexPath.row] capitalizedString];
    
    // Set the photo if it navigates to the PhotoView
    if ([segue.identifier isEqualToString:@"showPhoto"]) {
        //   UINavigationController *navController = segue.destinationViewController;
        //  SubMenu1 *photoController = [navController childViewControllers].firstObject;
        //  NSString *photoFilename = [NSString stringWithFormat:@"%@_photo", [_menuItems objectAtIndex:indexPath.row]];
        //  photoController.photoFilename = photoFilename;
    }
}



@end
