//
//  MenuItem.h
//  ObjCTrainerApp
//
//  Created by Mikaila Akeredolu on 5/31/14.
//  Copyright (c) 2014 Mikaila Akeredolu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject

@property (strong,nonatomic) NSString *menuTitle;
@property (strong,nonatomic) NSString *menuIcon;
@property (nonatomic) int screenType;

@end
