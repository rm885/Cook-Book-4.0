//
//  RecipeDetailViewController.m
//  Cook Book 4.0
//
//  Created by Mfon,Robert on 6/11/14.
//  Copyright (c) 2014 Robert Mfon. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RecipeDetailViewController ()

@property (nonatomic, weak) IBOutlet UIImageView* dishImageView;

@property (nonatomic, weak) IBOutlet UILabel* dishTitleLabel;

@property (nonatomic, weak) IBOutlet UILabel* twitterShareCountLabel;

@property (nonatomic, weak) IBOutlet UILabel* facebookShareCountLabel;

@end

@implementation RecipeDetailViewController

- (void)viewDidLoad
{
    self.dishImageView.image = [UIImage imageWithData:self.recipe.imageData];
    self.dishTitleLabel.text = self.recipe.name;
    self.twitterShareCountLabel.text = [NSString stringWithFormat:@"%d", self.recipe.twitterShareCount];
    self.facebookShareCountLabel.text = [NSString stringWithFormat:@"%d", self.recipe.facebookShareCount];
    
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ipad-BG-pattern.png"]];
    [self.view setBackgroundColor:bgColor];
    
    
    
    self.dishImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.dishImageView.layer.borderWidth = 3.0;
    self.dishImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.dishImageView.layer.shadowOpacity = 0.5;
    self.dishImageView.layer.shadowOffset = CGSizeMake(0, 4);
    
    
    
    [self.dishTitleLabel setTextColor:[UIColor colorWithRed:0.0 green:68.0/255 blue:118.0/255 alpha:1.0]];
    [self.dishTitleLabel setShadowColor:[UIColor whiteColor]];
    [self.dishTitleLabel setShadowOffset:CGSizeMake(0, 1)];
    
    
    [self.twitterShareCountLabel setTextColor:[UIColor colorWithRed:113.0/255 green:133.0/255 blue:148.0/255 alpha:1.0]];
    [self.twitterShareCountLabel setShadowColor:[UIColor whiteColor]];
    [self.twitterShareCountLabel setShadowOffset:CGSizeMake(0, 1)];
    
    
    [self.facebookShareCountLabel setTextColor:[UIColor colorWithRed:113.0/255 green:133.0/255 blue:148.0/255 alpha:1.0]];
    [self.facebookShareCountLabel setShadowColor:[UIColor whiteColor]];
    [self.facebookShareCountLabel setShadowOffset:CGSizeMake(0, 1)];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
