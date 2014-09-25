//
//  QuestionViewController.h
//  ObjCTrainerApp
//
//  Created by Mikaila Akeredolu on 5/31/14.
//  Copyright (c) 2014 Mikaila Akeredolu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionModel.h" //import this
#import "Question.h"

@interface QuestionViewController : UIViewController

//create propery for question model
@property (strong,nonatomic) QuestionModel *model;

//array for the questions
@property (strong,nonatomic) NSArray *questions;

//PROPERTIES for UI ELEMENTS

@property (weak, nonatomic) IBOutlet UIScrollView *questionScrollView;


//preoprty for disfficulty level that should be displaying
@property (nonatomic)QuizQuestionDifficulty questionDifficulty;


//properties for UIelements - go to story board and add scroll ves


//View Properties for Multiple choice questions
@property (weak, nonatomic) IBOutlet UILabel *questionText;

//button outlet properties
@property (weak, nonatomic) IBOutlet UIButton *questionMCAnswer1;

@property (weak, nonatomic) IBOutlet UIButton *questionMCAnswer2;

@property (weak, nonatomic) IBOutlet UIButton *questionMCAnswer3;


//properties for fill in the blanks add additional label
@property (weak, nonatomic) IBOutlet UIButton *submitAnswerForBlankButton;

@property (weak, nonatomic) IBOutlet UITextField *blankTextField;

@property (weak, nonatomic) IBOutlet UILabel *instructionLabelForBlank;

//properties for image questions
@property (weak, nonatomic) IBOutlet UIImageView *imageQuestionImageView;

@property (weak, nonatomic) IBOutlet UIButton *skipButton;
@end
