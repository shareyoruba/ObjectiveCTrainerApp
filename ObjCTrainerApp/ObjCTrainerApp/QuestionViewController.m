//
//  QuestionViewController.m
//  ObjCTrainerApp
//
//  Created by Mikaila Akeredolu on 5/31/14.
//  Copyright (c) 2014 Mikaila Akeredolu. All rights reserved.
//

#import "QuestionViewController.h"
#import "SWRevealViewController.h" //import in other to the add gesture recorgnizer

@interface QuestionViewController (){
    
    //create an ivar for current question
    Question *_currentQuestion;
    
     //create an instance variable for tappable part of image
    UIView *_tappablePortionOfImageQuestion;
    
    UITapGestureRecognizer * _tapRecorgnizer;
    UITapGestureRecognizer * _scrollViewTapGestureRecorgnizer;
    
}

@end

@implementation QuestionViewController

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
    
    //add tap gesture recorgnizer to scroll view
    
 _scrollViewTapGestureRecorgnizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewTapped)];
    
    
    [self.questionScrollView addGestureRecognizer:_scrollViewTapGestureRecorgnizer];
    
    //add pan gesture recorgnizer
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // call the helper method when view loads to hide buttons
    [self hideAllQuestionElements];
    
    //first create a quiz model object
    self.model = [[QuestionModel alloc]init];
    
    //check difficulty level and retrieve question for desired level
    self.questions = [self.model getQuestions:self.questionDifficulty];
    
    //display random question
    [self randomizeQuestionorDisplay];
    
    
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//create helper method here to hide question elements
-(void)hideAllQuestionElements
{
    self.questionText.hidden = YES;
    self.questionMCAnswer1.hidden = YES;
    self.questionMCAnswer2.hidden = YES;
    self.questionMCAnswer3.hidden = YES;
    self.submitAnswerForBlankButton.hidden = YES;
    self.blankTextField.hidden = YES;
    self.instructionLabelForBlank.hidden = YES;
    self.imageQuestionImageView.hidden = YES;
    //self.skipButton.hidden = YES;
    
    
    //remove the tappable uiview for image question
    
    //if in the scroll view remove it
    if (_tappablePortionOfImageQuestion.superview != nil)
    {
        [_tappablePortionOfImageQuestion removeFromSuperview];
        
    }
    
}

#pragma mark Question Methods

//create a private method to display current question usind ivar_currentquestion

-(void)displayCurrentquestion{
    switch (_currentQuestion.questionType) {
        case QuestionTypeMC:
            [self dispplayMCQuestion];
            break;
       case QuestionTypeBlank:
             [self dispplayBlankQuestion];
            break;
           
       case QuestionTypeImage:
             [self dispplayImageQuestion];
            break;
           
            
        default:
            break;
    }
    
}

//creating 3 seperate private helper methods for the types of questions

-(void)dispplayMCQuestion{ //private method
    
    [self hideAllQuestionElements];
    
    
    //reveal certain labels
     self.questionText.text = _currentQuestion.questionText; //set question text
    
    //set text buttons for answer using settitle uicontrolstate method
     [self.questionMCAnswer1 setTitle:_currentQuestion.questionAnswer1 forState:UIControlStateNormal];
     [self.questionMCAnswer2 setTitle:_currentQuestion.questionAnswer2 forState:UIControlStateNormal];
     [self.questionMCAnswer3 setTitle:_currentQuestion.questionAnswer3 forState:UIControlStateNormal];
  
    
    //adjust scroll view..make the width as wide as the scroll views width but height will be 30 pixels below the skip button
    
    self.questionScrollView.contentSize = CGSizeMake(self.questionScrollView.frame.size.width, self.skipButton.frame.origin.y + self.skipButton.frame.size.height + 30);
    
     self.questionText.hidden = NO;
     self.questionMCAnswer1.hidden = NO;
     self.questionMCAnswer2.hidden = NO;
     self.questionMCAnswer3.hidden = NO;
   }


-(void)dispplayImageQuestion{
    //to do set image
    [self hideAllQuestionElements];
    
    self.imageQuestionImageView.backgroundColor = [UIColor greenColor];
    
    int tappable_x = self.imageQuestionImageView.frame.origin.x + _currentQuestion.offset_x - 10;
    int tappable_y = self.imageQuestionImageView.frame.origin.y + _currentQuestion.offset_y - 10;
    
    //create uiview 20 by 20 put at coordinate where user must tap and minus the width and height by 10 to taget middle
    
    _tappablePortionOfImageQuestion = [[UIView alloc] initWithFrame:CGRectMake(tappable_x,tappable_y, 20, 20)];
    
    _tappablePortionOfImageQuestion.backgroundColor = [UIColor redColor];
    
    //create and attach gesture recorgnizer ivar
    _tapRecorgnizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageQuestionAnswered)];
    
    //add gesture recorgnizer to uiview
    [_tappablePortionOfImageQuestion addGestureRecognizer:_tapRecorgnizer];
    
    //add tapable part
    [self.questionScrollView addSubview:_tappablePortionOfImageQuestion]; //add tapable portion of image
    
    self.imageQuestionImageView.hidden = NO;
    
}

-(void)dispplayBlankQuestion{
    
    [self hideAllQuestionElements]; //hide first before revealing
    
    self.questionText.text = _currentQuestion.questionText; //set question text
    
    //adjust scroll view..make the width as wide as the scroll views width but height will be 30 pixels below the skip button
    self.questionScrollView.contentSize = CGSizeMake(self.questionScrollView.frame.size.width, self.skipButton.frame.origin.y + self.skipButton.frame.size.height + 30);
    
    //reveal question elemnts
    self.questionText.hidden = NO;
    self.submitAnswerForBlankButton.hidden = NO;
    self.blankTextField.hidden = NO;
    self.instructionLabelForBlank.hidden = NO;
}

//randomize another question and display it
-(void)randomizeQuestionorDisplay
{
    //randomize a question (show random questions)
    int randomQuestionIndex = arc4random()% self.questions.count; //get index from 0 to max questions
    
    _currentQuestion = self.questions[randomQuestionIndex];
    
    
    //display the question
    [self displayCurrentquestion];
}

-(IBAction)skipButtonClicked:(id)sender{
    //randomize and display another question
    [self randomizeQuestionorDisplay];
}


#pragma mark - Question Answer Handlers

-(IBAction)questionMCAnswer:(id)sender{

    //saving data locally
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //Record that they answered a multiple choice question
    int mcQuestionsAnswered = [userDefaults integerForKey:@"MCQuestionsAnswered"];
    mcQuestionsAnswered++;
    
    //save it back
    [userDefaults setInteger:mcQuestionsAnswered forKey:@"MCQuestionsAnswered"];
    
    UIButton *selectedButton = (UIButton *)sender;
    
    if (selectedButton.tag == _currentQuestion.correctMCQuestionIndex) {
        //user gt it right
        //TODO display message for correct answer
        
        
        //Record that they answered a multiple choice question
        int mcQuestionsAnsweredCorrectly = [userDefaults integerForKey:@"MCQuestionsAnsweredCorrectly"];
        mcQuestionsAnsweredCorrectly++;
        
        [userDefaults setInteger:mcQuestionsAnsweredCorrectly forKey:@"MCQuestionsAnsweredCorrectly"];
        
    }
    else
    {
        //user got it wrong
    }
    //call synchronize method
    [userDefaults synchronize];
    
    //display next question
    
    [self randomizeQuestionorDisplay];
}

-(void)imageQuestionAnswered
{
    //TO DO: display message for correct answer
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //Record that they answered an image question.
    
    int imageQuestionAnswered = [userDefaults integerForKey:@"ImageQuestionAnwered"];
    imageQuestionAnswered++;
    [userDefaults setInteger:imageQuestionAnswered forKey:@"ImageQuestionAnwered"];
    
    //user got it right
    int imageQuestionsAnsweredCorrectly = [userDefaults integerForKey:@"ImageQuestionsAnsweredCorrectly"];
    imageQuestionsAnsweredCorrectly++;
    [userDefaults setInteger:imageQuestionsAnsweredCorrectly forKey:@"ImageQuestionsAnsweredCorrectly"];
    
    [userDefaults synchronize];
    
    //display next question
    
    [self randomizeQuestionorDisplay];
}


// when use submits blank textfield answer
-(IBAction)blankSubmitted:(id)sender{
    
      //Record that they answered an blank question.
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    
    int blankQuestionAnswered = [userDefaults integerForKey:@"blankQuestionAnwered"];
    blankQuestionAnswered++;
    [userDefaults setInteger:blankQuestionAnswered forKey:@"blankQuestionAnwered"];
    
    NSString *answer = self.blankTextField.text;
    
    if ([answer isEqualToString:_currentQuestion.correctAnswerForBlank]) {
        //u git it right
        //user got it right
    int blankQuestionsAnsweredCorrectly = [userDefaults integerForKey:@"blankQuestionsAnsweredCorrectly"];
        blankQuestionsAnsweredCorrectly++;
        [userDefaults setInteger:blankQuestionsAnsweredCorrectly forKey:@"blankQuestionsAnsweredCorrectly"];

    }
    else
    {
        //u got it wrong
        
    }
     [userDefaults synchronize];
    
    //display next question
    
    [self randomizeQuestionorDisplay];
}

-(void)scrollViewTapped{
    [self.blankTextField resignFirstResponder];
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

@end
