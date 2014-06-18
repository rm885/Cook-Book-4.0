//
//  SettingsViewController.m
//  Cook Book 4.0
//
//  Created by Mfon,Robert on 6/11/14.
//  Copyright (c) 2014 Robert Mfon. All rights reserved.
//

#import "SettingsViewController.h"
#import "STSegmentedControl.h"

@interface SettingsViewController ()

//@property (nonatomic, strong) UISegmentedControl * restrictSegmentControl;

@property (nonatomic, strong) STSegmentedControl * restrictSegmentControl;

@property (nonatomic, weak) IBOutlet UISlider * restrictSlider;

@property (nonatomic, weak) IBOutlet UILabel * maximumLabel;

@end

@implementation SettingsViewController

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
    NSArray *objects = [NSArray arrayWithObjects:@"Yes", @"No", nil];
	
    self.restrictSegmentControl = [[STSegmentedControl alloc] initWithItems:objects];
	self.restrictSegmentControl.frame = CGRectMake(20, 49, 120, 45);
	[self.view addSubview:self.restrictSegmentControl];
    
    
    /*
     
     self.restrictSegmentControl = [[UISegmentedControl alloc] initWithItems:objects];
     [self.restrictSegmentControl setFrame:CGRectMake(20, 49, 144, 44)];
     [self.view addSubview:self.restrictSegmentControl];
     */
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    BOOL restrictResults = [defaults boolForKey:@"restrictResults"];
    int numberOfResults = [defaults integerForKey:@"numberOfResults"];
    
    int selectedIndex = restrictResults ? 0 : 1;
    
    [self.restrictSegmentControl setSelectedSegmentIndex:selectedIndex];
    
    [self.restrictSlider setValue:numberOfResults];
    
    [self.maximumLabel setText:[NSString stringWithFormat:@"%d", numberOfResults]];
    
    [self.restrictSegmentControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.restrictSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ipad-BG-pattern.png"]];
    [self.view setBackgroundColor:bgColor];
    
    
    [super viewDidLoad];
    
}

-(void)segmentedControlValueChanged:(id)sender{
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    BOOL restrictResults = self.restrictSegmentControl.selectedSegmentIndex == 0 ? YES : NO;
    
    [defaults setBool:restrictResults forKey:@"restrictResults"];
    
    [defaults synchronize];
    
}


-(void)sliderValueChanged:(id)sender{
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    int numberOfResults = (int)self.restrictSlider.value;
    
    [self.maximumLabel setText:[NSString stringWithFormat:@"%d", numberOfResults]];
    
    [defaults setInteger:numberOfResults forKey:@"numberOfResults"];
    
    [defaults synchronize];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
