//
//  RecipeListViewController.m
//  Cook Book 4.0
//
//  Created by Mfon,Robert on 6/11/14.
//  Copyright (c) 2014 Robert Mfon. All rights reserved.
//

#import "RecipeListViewController.h"
#import "Recipe.h"
#import "RecipeCell.h"
#import "RecipeDetailViewController.h"
#import <QuartzCore/QuartzCore.h>

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define kAppId @"53bbe057"
#define kAppkey @"63244f338e1f79c34e00fba71c1ed748"

@interface RecipeListViewController ()

@property (nonatomic, strong) NSArray* recipes;

@property (nonatomic, weak) IBOutlet UITableView* tableView;

-(void)loadRecipes;

@end

@implementation RecipeListViewController

- (void)viewDidLoad
{
    
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self setTitle:@"Loading..."];
    
    UIBarButtonItem* refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(loadRecipes)];
    self.navigationItem.rightBarButtonItem = refreshButton;
    
    [self loadRecipes];
    
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ipad-BG-pattern.png"]];
    [self.view setBackgroundColor:bgColor];
    
    
    //[self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadRecipes
{
    dispatch_async(kBgQueue, ^{
        
        self.recipes = [NSArray arrayWithArray:[self getRecipeFromApi]];
        
        
        [self performSelectorOnMainThread:@selector(dataRequestCompleted:) withObject:nil waitUntilDone:YES];
    });
}

-(NSArray*)getRecipeFromApi{
    NSString *url = [NSString  stringWithFormat:@"http://api.yummly.com/v1/api/recipes?_app_id=%@&_app_key=%@&requirePictures=true", kAppId, kAppkey];
    
    NSError* error;
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    
    NSDictionary* recipeDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:kNilOptions
                                                                       error:&error];
    
    NSArray* recipeArray = (NSArray*)[recipeDictionary objectForKey:@"matches"];
    
    return [self getSingeRecipeData:recipeArray];
}

-(NSArray*)getSingeRecipeData:(NSArray*)recipes{
    
    NSMutableArray *rs = [NSMutableArray array];
    
    for (NSDictionary* dic in recipes) {
        
        NSString* recipeName = [dic objectForKey:@"id"];
        
        NSString* getRecipeUrl = [NSString stringWithFormat:@"http://api.yummly.com/v1/api/recipe/%@?_app_id=%@&_app_key=%@", recipeName, kAppId, kAppkey];
        
        NSData* recipeData = [NSData dataWithContentsOfURL:[NSURL URLWithString:getRecipeUrl]];
        
        NSError* error;
        NSDictionary* singleRecipe = [NSJSONSerialization JSONObjectWithData:recipeData
                                                                     options:kNilOptions
                                                                       error:&error];
        
        Recipe *recipe = [[Recipe alloc] init];
        
        recipe.name = [singleRecipe objectForKey:@"name"];
        
        NSArray* images = [singleRecipe objectForKey:@"images"];
        
        if([images count] > 0){
            NSDictionary* imagesDictionary = images[0];
            
            recipe.thumbNail = [imagesDictionary objectForKey:@"hostedLargeUrl"];
        }
        
        //Yummly API doesn't have a twitter/facebook count unlike the PunchFork API
        recipe.twitterShareCount = 245;//[dic objectForKey:@"twc"] intValue];
        recipe.facebookShareCount = 19;//[[dic objectForKey:@"fbc"] intValue];
        
        [rs addObject:recipe];
    }
    
    return rs;
    
}

-(void)dataRequestCompleted:(id)responseData
{
    [self setTitle:@"Recipes"];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.recipes count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 67;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RecipeCell";
    
    RecipeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Recipe *recipe = [self.recipes objectAtIndex:indexPath.row];
    
    [cell setDetailsWithRecipe:recipe];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"detail" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    RecipeDetailViewController* detail = segue.destinationViewController;
    
    NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
    
    detail.recipe = [self.recipes objectAtIndex:indexPath.row];
    
}

@end
