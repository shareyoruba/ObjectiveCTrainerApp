//
//  QuestionClass.h
//  ObjCTrainerApp
//
//  Created by Mikaila Akeredolu on 6/11/14.
//  Copyright (c) 2014 Mikaila Akeredolu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

//QuizQuestionType Enum; //used as class types in question class
@property (nonatomic) QuizQuestionType questionType; //see enum


@property (nonatomic) QuizQuestionDifficulty questionDifficulty;
//see enum - notice no asterix

//propert for questionsText
@property (strong,nonatomic)NSString *questionText;


//properties for MC - mulitple choice
@property(strong,nonatomic)NSString *questionAnswer1;
@property(strong,nonatomic)NSString *questionAnswer2;
@property(strong,nonatomic)NSString *questionAnswer3;


// property to indicate which answer is the right/corect one
@property (nonatomic) int correctMCQuestionIndex;


//properties for fill in the blank
@property (strong,nonatomic) NSString *correctAnswerForBlank;


//properties for find within image
@property (nonatomic) int offset_x; //use cordinates top left corner
@property (nonatomic) int offset_y;
@property (nonatomic,strong) NSString *questionImageName; //string reppin image name

//now go the questionModel 
@end
