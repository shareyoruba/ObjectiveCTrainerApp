//
//  MenuItem.h
//  ObjCTrainerApp
//
//  Created by Mikaila Akeredolu on 5/31/14.
//  Copyright (c) 2014 Mikaila Akeredolu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject //class for menu items such as tiltle and icons

@property (strong,nonatomic) NSString *menuTitle;
@property (strong,nonatomic) NSString *menuIcon;

//@property (nonatomic) int screenType;

@property (nonatomic) MenuItemScreenType screenType;

// MenuItemScreenType created from enumeration type in prefix.pch file

@end
