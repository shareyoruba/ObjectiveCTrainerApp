//
//  Question.m
//  ObjCTrainerApp
//
//  Created by Mikaila Akeredolu on 5/31/14.
//  Copyright (c) 2014 Mikaila Akeredolu. All rights reserved.
//

#import "QuestionModel.h"
#import "Question.h"

@implementation QuestionModel

//overide the init method fo the question model and initialize the arrays

//create dummy questions and put in the arrays
/*
 @property (strong, nonatomic)NSMutableArray *easyQuestions;
 @property (strong, nonatomic)NSMutableArray *mediumQuestions;
 @property (strong, nonatomic)NSMutableArray *hardQuestions;
 */

-(id)init{
    self = [super init]; //calling init method of nsobject class
    
    if (self) {
        //initialize all of these arrays in here
         self.easyQuestions = [[NSMutableArray alloc]init];
         self.mediumQuestions = [[NSMutableArray alloc]init];
         self.hardQuestions = [[NSMutableArray alloc]init];
    }
    return self;
    
}


-(NSMutableArray *)getQuestions:(QuizQuestionDifficulty)difficulty

{
    
  

    //use QuestionClass to create some easy questions

    
    Question *newQuestion = [[Question alloc]init]; //import question class
    
    newQuestion.questionDifficulty = QuestionDifficultyEasy;
    //@property (nonatomic) QuizQuestionDifficulty questionDifficulty; //from question.h
    
    newQuestion.questionType = QuestionTypeMC;
    //@property (nonatomic) QuizQuestionType questionType;from question.h
    
     newQuestion.questionText =@"This is a test question";
     newQuestion.questionAnswer1 = @"Answer one";
     newQuestion.questionAnswer2 = @"Answer two";
     newQuestion.questionAnswer3 = @"Answer three";
    newQuestion.correctMCQuestionIndex = 1; //correct answer
    [self.easyQuestions addObject:newQuestion];
    
    //
    
    newQuestion = [[Question alloc]init]; //assigning a new variable/object
    newQuestion.questionDifficulty = QuestionDifficultyEasy;
    newQuestion.questionType = QuestionTypeBlank;
    newQuestion.questionText = @"This is a _________question";
    newQuestion.correctAnswerForBlank = @"test";
    [self.easyQuestions addObject:newQuestion];
    

    //create an image question
    
    newQuestion = [[Question alloc]init]; //assigning a new variable/object
    newQuestion.questionDifficulty = QuestionDifficultyEasy;
    newQuestion.questionType = QuestionTypeImage;
    newQuestion.questionImageName = @"TestQuestionImage";
    newQuestion.offset_x = 50; //if the click within image vicinity they get it coorect
    newQuestion.offset_y = 50;
    [self.easyQuestions addObject:newQuestion];
    
    
    return self.easyQuestions;
    //return set of easy questions for now
    
    //better implementation is using json parse it then check difficulty type
    
   //self.easyquestions from: @property (strong, nonatomic)NSMutableArray *easyQuestions;
    
}


@end
