//
//  RecipeCell.h
//  Cook Book 4.0
//
//  Created by Mfon,Robert on 6/11/14.
//  Copyright (c) 2014 Robert Mfon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Recipe.h"

@interface RecipeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *disclosureImageView;
@property (weak, nonatomic) IBOutlet UIImageView *dishImageView;
@property (weak, nonatomic) IBOutlet UILabel *dishTitle;
@property (weak, nonatomic) IBOutlet UILabel *twitterCount;

-(void)setDetailsWithRecipe:(Recipe*)recipe;

@end

