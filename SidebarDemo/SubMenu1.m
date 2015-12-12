//
//  PhotoViewController.m
//  SidebarDemo
//
//  Created by Simon on 30/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "SubMenu1.h"
#import "PlayMusicScreen.h"
#import "SWRevealViewController.h"
@interface SubMenu1 () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewA;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;

@end

@implementation SubMenu1

NSDictionary *dictAnimals;
NSArray *arrayAnimalSectionTitles;
NSArray *arrayKeys;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.backButton setTarget: self.revealViewController];
        [self.backButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    } // Back Menu của SWReveal
    
    dictAnimals = @{@"B" : @[@"Bear", @"Black Swan", @"Buffalo"],
                    @"C" : @[@"Camel", @"Cockatoo"],
                    @"D" : @[@"Dog", @"Donkey"],
                    @"E" : @[@"Emu"],
                    @"G" : @[@"Giraffe", @"Greater Rhea"],
                    @"H" : @[@"Hippopotamus", @"Horse"],
                    @"K" : @[@"Koala"],
                    @"L" : @[@"Lion", @"Llama"],
                    @"M" : @[@"Manatus", @"Meerkat"],
                    @"P" : @[@"Panda", @"Peacock", @"Pig", @"Platypus", @"Polar Bear"],
                    @"R" : @[@"Rhinoceros"],
                    @"S" : @[@"Seagull"],
                    @"T" : @[@"Tasmania Devil"],
                    @"W" : @[@"Whale", @"Whale Shark", @"Wombat"]};
    
    arrayKeys = [dictAnimals allKeys];
    arrayAnimalSectionTitles = [arrayKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

- (NSString*) getImageFileName: (NSString*) animal {
    NSString *imageFileName = animal.lowercaseString;
    imageFileName = [imageFileName stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    imageFileName = [imageFileName stringByAppendingString:@".jpg"];
    return imageFileName;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return arrayAnimalSectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *sectionTitle = arrayAnimalSectionTitles[section];
    NSArray *sectionAnimals = dictAnimals[sectionTitle];
    return sectionAnimals.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return arrayAnimalSectionTitles[section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return arrayAnimalSectionTitles;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSString *sectionTitle = [arrayAnimalSectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionAnimals = [dictAnimals objectForKey:sectionTitle];
    NSString *animal = [sectionAnimals objectAtIndex:indexPath.row];
    cell.textLabel.text = animal;
    cell.imageView.image = [UIImage imageNamed:[self getImageFileName:animal]];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayMusicScreen *playMusicScreen = [ PlayMusicScreen new];
    
[self.navigationController pushViewController:playMusicScreen animated:YES];

}

@end
