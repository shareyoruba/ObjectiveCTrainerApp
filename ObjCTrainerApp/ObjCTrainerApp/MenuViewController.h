//
//  MenuViewController.h
//  ObjCTrainerApp
//
//  Created by Mikaila Akeredolu on 5/31/14.
//  Copyright (c) 2014 Mikaila Akeredolu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"
#import "Menu.h"


@interface MenuViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

//create properties for Menu classs
@property (strong,nonatomic) Menu * model;
@property (strong,nonatomic) NSArray *mItems;

//connect tableview as outlet
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
