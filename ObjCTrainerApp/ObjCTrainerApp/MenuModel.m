//
//  Menu.m
//  ObjCTrainerApp
//
//  Created by Mikaila Akeredolu on 5/31/14.
//  Copyright (c) 2014 Mikaila Akeredolu. All rights reserved.
//

#import "MenuModel.h"
#import "MenuItem.h" //import MenuItem to use the class menuitem to create objects of type menu item

@implementation MenuModel

//implementation of menuItems method
- (NSArray *)getMenuItems{
    
    //create an nsmutable array
    NSMutableArray *menuItemArray = [[NSMutableArray alloc]init];
    
    MenuItem *item1 = [[MenuItem alloc]init];
    //menutitle & screenType are propertys of MenuItem.h

    item1.menuTitle = @"Easy Questions";
    item1.screenType = ScreenTypeQuestions; //under enum
    //add to array
    [menuItemArray addObject:item1]; //add to menuitemarray
    
    MenuItem *item2 = [[MenuItem alloc]init];
    item2.menuTitle = @"Medium Questions";
    item2.screenType = ScreenTypeQuestions;
    [menuItemArray addObject:item2];
    
    MenuItem *item3 = [[MenuItem alloc]init];
    item3.menuTitle = @"Hard Questions";
    item3.screenType = ScreenTypeQuestions;
    [menuItemArray addObject:item3];
    
    MenuItem *item4 = [[MenuItem alloc]init];
    item4.menuTitle = @"Statistics";
    item4.screenType = ScreenTypeStats; //under enum
    [menuItemArray addObject:item4];
    
    MenuItem *item5 = [[MenuItem alloc]init];
    item5.menuTitle = @"About";
    item5.screenType = ScreenTypeAbout;//under enum
    [menuItemArray addObject:item5];
    
    MenuItem *item6 = [[MenuItem alloc]init];
    item6.menuTitle = @"Remove Ads";
    item6.screenType = ScreenTypeRemoveAds;//under enum
    [menuItemArray addObject:item6];


    // NSMutableArray *menuItemArray = [[NSMutableArray alloc]init];
    return menuItemArray;

    
}
@end
