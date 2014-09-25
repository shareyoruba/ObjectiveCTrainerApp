//
//  Question.h
//  ObjCTrainerApp
//
//  Created by Mikaila Akeredolu on 5/31/14.
//  Copyright (c) 2014 Mikaila Akeredolu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionModel : NSObject


//create a couple of arrays for different difficulty of questions

@property (strong, nonatomic)NSMutableArray *easyQuestions;
@property (strong, nonatomic)NSMutableArray *mediumQuestions;
@property (strong, nonatomic)NSMutableArray *hardQuestions;


//create method to return the arrays

-(NSMutableArray *)getQuestions:(QuizQuestionDifficulty)difficulty;

//from - @property (nonatomic) QuizQuestionDifficulty questionDifficulty; in question Model

//also from enum (QuizQuestionDifficulty)
@end
