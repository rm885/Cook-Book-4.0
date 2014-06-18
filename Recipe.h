//
//  Recipe.h
//  Cook Book 4.0
//
//  Created by Mfon,Robert on 6/11/14.
//  Copyright (c) 2014 Robert Mfon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *thumbNail;
@property (nonatomic, assign) int twitterShareCount;
@property (nonatomic, assign) int facebookShareCount;
@property (nonatomic, retain) NSData* imageData;

-(void)loadData;
@end
