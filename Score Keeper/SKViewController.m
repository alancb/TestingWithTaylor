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
static CGFloat percentWidthOfStepper = 0.30;

@interface SKViewController ()

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIScrollView * scrollView;
@property (nonatomic) int numberOfScoreViews;
@property (strong, nonatomic) NSMutableArray * scoreLabelArray;

@end

@implementation SKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //intialize numberOfScoreViews
    self.numberOfScoreViews = 0;
    
    self.title = @"TRM ScoreKeeper";
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 1.5);
    [self.view addSubview:self.scrollView];
    
    //Add two scoreviews for testing
    [self addScoreView:self.numberOfScoreViews];
    [self addScoreView:self.numberOfScoreViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    stepper.minimumValue = -1000;
    stepper.maximumValue = 9999;
    stepper.tag = index;
    
    [scoreView addSubview:nameField];
    [scoreView addSubview:scoreLabel];
    [scoreView addSubview:stepper];
    [self.scrollView addSubview:scoreView];
    self.numberOfScoreViews++;
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
