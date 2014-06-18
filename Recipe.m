//
//  Recipe.m
//  Cook Book 4.0
//
//  Created by Mfon,Robert on 6/11/14.
//  Copyright (c) 2014 Robert Mfon. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

@synthesize name;
@synthesize thumbNail;
@synthesize twitterShareCount;
@synthesize facebookShareCount;
@synthesize imageData;


-(void)loadData
{
    NSURL* url = [NSURL URLWithString:self.thumbNail];
    self.imageData = [NSData dataWithContentsOfURL:url];
    
}

@end
