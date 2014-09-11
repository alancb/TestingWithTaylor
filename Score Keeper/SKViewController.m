//
//  SKViewController.m
//  Score Keeper
//
//  Created by Taylor Mott on 9.10.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "SKViewController.h"

static CGFloat margin = 15;                             //side margins
static CGFloat scoreViewHeight = 64;                    //scoreViewHeight
static CGFloat percentWidthOfNameField = 0.55;
static CGFloat percentWidthOfScoreLabel = 0.15;
static CGFloat percentWidthOfStepper = 0.30;            //should add up to 1.0

@interface SKViewController ()

@property (strong, nonatomic) UIScrollView * scrollView;
@property (nonatomic) int numberOfScoreViews;
@property (strong, nonatomic) NSMutableArray * scoreLabelArray;

@end

@implementation SKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //initialize numberOfScoreViews
    self.numberOfScoreViews = 0;
    
    //initialize scoreLabelArray
    self.scoreLabelArray = [[NSMutableArray alloc] init];
    
    self.title = @"TRM ScoreKeeper";
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 1.5);
    [self.view addSubview:self.scrollView];
    
    [self addScoreView:self.numberOfScoreViews];
    [self addScoreView:self.numberOfScoreViews];
    [self addScoreView:self.numberOfScoreViews];
    [self addScoreView:self.numberOfScoreViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 * addScoreView creates a new score view that has a UITextField for a name, UILabel to display score 
 * (UIStepper value), and a UIStepper to control the UILabel. This method takes an int to track how many
 * scoreViews have been added.
 */

-(void)addScoreView:(int)index
{
    UIView * scoreView = [[UIView alloc] initWithFrame: CGRectMake(0, scoreViewHeight * index, self.view.frame.size.width, scoreViewHeight)];
    
    CGFloat widthOfNameField = (self.view.frame.size.width - 2 * margin) * percentWidthOfNameField;
    CGFloat widthOfScoreLabel = (self.view.frame.size.width - 2 * margin) * percentWidthOfScoreLabel;
    CGFloat widthOfStepper = (self.view.frame.size.width - 2 * margin) * percentWidthOfStepper;
    
    UITextField * nameField = [[UITextField alloc] initWithFrame:CGRectMake(margin, 0, widthOfNameField, scoreViewHeight)];
    nameField.placeholder = @"Name";
    
    UILabel * scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin + widthOfNameField, 0, widthOfScoreLabel, scoreViewHeight)];
    scoreLabel.text = @"0";
    [self.scoreLabelArray insertObject:scoreLabel atIndex:index];
    
    UIStepper * stepper = [[UIStepper alloc] initWithFrame:CGRectMake(margin + widthOfNameField + widthOfScoreLabel, 16, widthOfStepper, scoreViewHeight)];
    stepper.minimumValue = -999;
    stepper.maximumValue = 9999;
    stepper.tag = index;
    [stepper addTarget:self action:@selector(updateScoreLabel:) forControlEvents:UIControlEventValueChanged];
    
    [scoreView addSubview:nameField];
    [scoreView addSubview:scoreLabel];
    [scoreView addSubview:stepper];
    [self.scrollView addSubview:scoreView];
    self.numberOfScoreViews++;
}

/* 
 * action for stepper value being changed. This method will update the appropriate label based
 * on sender.tag
 */

- (void)updateScoreLabel:(UIStepper *)sender
{
    UILabel * labelToBeUpdated = self.scoreLabelArray[sender.tag];
    labelToBeUpdated.text = [NSString stringWithFormat:@"%.f", sender.value];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
