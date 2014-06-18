//
//  STSegmentedControl.h
//  Cook Book 4.0
//
//  Created by Mfon,Robert on 6/11/14.
//  Copyright (c) 2014 Robert Mfon. All rights reserved.
//

#import <Foundation/Foundation.h>

#define STSegmentedControlHeight 43.0

enum {
    STSegmentedControlNoSegment = -1 // segment index for no selected segment
};

@interface STSegmentedControl : UIControl {
	NSMutableArray *segments;
	UIImage *normalImageLeft;
	UIImage *normalImageMiddle;
	UIImage *normalImageRight;
	UIImage *selectedImageLeft;
	UIImage *selectedImageMiddle;
	UIImage *selectedImageRight;
	NSUInteger numberOfSegments;
	NSInteger selectedSegmentIndex;
	BOOL programmaticIndexChange;
	BOOL momentary;
}

- (id)initWithItems:(NSArray *)items; // items can be NSStrings or UIImages.

- (void)insertSegmentWithTitle:(NSString *)title atIndex:(NSUInteger)index; // insert before segment number
- (void)insertSegmentWithImage:(NSString *)image atIndex:(NSUInteger)index;
- (void)removeSegmentAtIndex:(NSUInteger)index;
- (void)removeAllSegments;

- (void)setTitle:(NSString *)title forSegmentAtIndex:(NSUInteger)index;
- (NSString *)titleForSegmentAtIndex:(NSUInteger)index;

- (void)setImage:(NSString *)image forSegmentAtIndex:(NSUInteger)index;
- (UIImage *)imageForSegmentAtIndex:(NSUInteger)index;

@property (nonatomic ,retain) NSMutableArray *segments;
@property (nonatomic,retain) UIImage *normalImageLeft;
@property (nonatomic,retain) UIImage *normalImageMiddle;
@property (nonatomic,retain) UIImage *normalImageRight;
@property (nonatomic,retain) UIImage *selectedImageLeft;
@property (nonatomic,retain) UIImage *selectedImageMiddle;
@property (nonatomic, retain) UIImage *selectedImageRight;
@property (nonatomic, readonly) NSUInteger numberOfSegments;
@property (nonatomic, getter=isMomentary) BOOL momentary; //
@property (nonatomic, readwrite) NSInteger selectedSegmentIndex;

-(void)initializeImages;

@end
