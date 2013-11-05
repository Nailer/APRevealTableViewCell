//
//  APViewController.m
//  APRevealTableViewCell
//
//  Created by Andreas Petrov on 05/11/13.
//  Copyright (c) 2013 Andreas Petrov. All rights reserved.
//

#import "APViewController.h"
#import "APRevealTableViewCell.h"
#import "DemoRevealCell.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface APViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation APViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.tableView registerClass:[DemoRevealCell class] forCellReuseIdentifier:CellIdentifier];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)tableCellTitles
{
    static NSArray *titles = nil;

    if (titles == nil)
    {
        titles = @[ @"One cell" ];
    }

    return titles;
}

- (DemoRevealCell *)prototypeCell
{
    static DemoRevealCell *prototypeCell = nil;
    if (prototypeCell == nil)
    {
        prototypeCell = [[DemoRevealCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    return prototypeCell;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableCellTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    APRevealTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.prototypeCell.frame.size.height;
}

@end
