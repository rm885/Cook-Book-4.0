//
//  RecipeCell.m
//  Cook Book 4.0
//
//  Created by Mfon,Robert on 6/11/14.
//  Copyright (c) 2014 Robert Mfon. All rights reserved.
//

#import "RecipeCell.h"

@implementation RecipeCell
@synthesize dishImageView;
@synthesize dishTitle;
@synthesize twitterCount;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
    
    if(selected)
    {
        UIImage* bg = [UIImage imageNamed:@"ipad-list-item-selected.png"];
        UIImage* disclosureImage = [UIImage imageNamed:@"ipad-arrow-selected.png"];
        
        [self.bgImageView setImage:bg];
        [self.disclosureImageView setImage:disclosureImage];
        
        [self.dishTitle setTextColor:[UIColor whiteColor]];
        [self.dishTitle setShadowColor:[UIColor colorWithRed:25.0/255 green:96.0/255 blue:148.0/255 alpha:1.0]];
        [self.dishTitle setShadowOffset:CGSizeMake(0, -1)];
        
        
        [self.twitterCount setTextColor:[UIColor whiteColor]];
        [self.twitterCount setShadowColor:[UIColor colorWithRed:25.0/255 green:96.0/255 blue:148.0/255 alpha:1.0]];
        [self.twitterCount setShadowOffset:CGSizeMake(0, -1)];
        
    }
    else
    {
        UIImage* bg = [UIImage imageNamed:@"ipad-list-element.png"];
        UIImage* disclosureImage = [UIImage imageNamed:@"ipad-arrow.png"];
        
        [self.bgImageView setImage:bg];
        [self.disclosureImageView setImage:disclosureImage];
        
        [self.dishTitle setTextColor:[UIColor colorWithRed:0.0 green:68.0/255 blue:118.0/255 alpha:1.0]];
        [self.dishTitle setShadowColor:[UIColor whiteColor]];
        [self.dishTitle setShadowOffset:CGSizeMake(0, 1)];
        
        
        [self.twitterCount setTextColor:[UIColor colorWithRed:113.0/255 green:133.0/255 blue:148.0/255 alpha:1.0]];
        [self.twitterCount setShadowColor:[UIColor whiteColor]];
        [self.twitterCount setShadowOffset:CGSizeMake(0, 1)];
        
    }
    
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setDetailsWithRecipe:(Recipe*)recipe
{
    dishTitle.text = recipe.name;
    twitterCount.text = [NSString stringWithFormat:@"%d", recipe.twitterShareCount];
    
    
    if(recipe.imageData)
    {
        UIImage *image = [UIImage imageWithData:recipe.imageData];
        dishImageView.image = image;
    }
    else
    {
        [recipe loadData];
        UIImage *image = [UIImage imageWithData:recipe.imageData];
        
        dishImageView.image = image;
    }
}

@end

