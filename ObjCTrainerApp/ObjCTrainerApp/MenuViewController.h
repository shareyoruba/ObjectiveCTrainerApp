//
//  MenuViewController.h
//  ObjCTrainerApp
//
//  Created by Mikaila Akeredolu on 5/31/14.
//  Copyright (c) 2014 Mikaila Akeredolu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"
#import "MenuModel.h"

//comform to tableview delegate/protocol
@interface MenuViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

//create properties for Menu classs
@property (strong,nonatomic) MenuModel * model;

@property (strong,nonatomic) NSArray *mItems; //aka - menuItems

//connect tableview as outlet via storyboard
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
