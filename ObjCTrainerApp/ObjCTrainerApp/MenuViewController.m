//
//  MenuViewController.m
//  ObjCTrainerApp
//
//  Created by Mikaila Akeredolu on 5/31/14.
//  Copyright (c) 2014 Mikaila Akeredolu. All rights reserved.
//

#import "MenuViewController.h"
#import "SWRevealViewController.h"


@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // set self as data source and delegate for the tableview
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
//fetch the menu items by using the nssarray method getmenuitems from menuVC.h class
    
    //@property (strong,nonatomic) NSArray *mItems;
    self.mItems = [[[Menu alloc]init]getMenuItems]; //returns list of mitems array
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view delegate methods

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.mItems.count; //retun menuItems aary
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //retrieve cell
    NSString *cellIdentifier = @"MenuItemCell";
    
    UITableViewCell *menuCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //get menu item that it is asking for
    MenuItem *item = self.mItems[indexPath.row];
    
    //set menu item text and icon with properties
    menuCell.textLabel.text = item.menuTitle; //menuTitle = property of MenuItem Class
    
    return menuCell;
}

//when user taps on menu item, check which item was tapped!

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MenuItem *item = self.mItems[indexPath.row];
    
    switch (item.screenType) { //screenType is property of MenuItem.h
        //go to questions screen by calling the method perform segwaywithidentifier
        case ScreenTypeQuestions:
            //go to questions screen
            [self performSegueWithIdentifier:@"GoToQuestionsSegue" sender:self];
            break;
            
       case ScreenTypeStats:
           //go to stats  screen
            [self performSegueWithIdentifier:@"GoToStatsSegue" sender:self];
            break;
            
       case ScreenTypeAbout:
          //go to about screen
            [self performSegueWithIdentifier:@"GoToAboutSegue" sender:self];
            break;
            
       case ScreenTypeRemoveAds:
            //go to remove ads screen
            [self performSegueWithIdentifier:@"GoToRemoveAdsSegue" sender:self];
            break;
            
        default:
            break;
        }
    
    
  }

#pragma  segue methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //check what type of segue and do something specific
    //call the method setfront view controller on the revealVC and set it to the destination VC of wherever that segue is connected to via storyboard
    
    [self.revealViewController setFrontViewController:segue.destinationViewController];
    
    //slide the front view controller back into place
    [self.revealViewController revealToggleAnimated:YES];
}

@end
