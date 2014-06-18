//
//  RecipeListViewController.h
//  Cook Book 4.0
//
//  Created by Mfon,Robert on 6/11/14.
//  Copyright (c) 2014 Robert Mfon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchField;
- (IBAction)search:(id)sender;


@end
