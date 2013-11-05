//
//  DemoRevealCell.m
//  APRevealTableViewCell
//
//  Created by Andreas Petrov on 05/11/13.
//  Copyright (c) 2013 Andreas Petrov. All rights reserved.
//

#import "DemoRevealCell.h"

@implementation DemoRevealCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]))
    {
        [self setupContent];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self setupContent];
    }
    
    return self;
}

- (void)setupContent
{
    UIView *contentView = [[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil]instantiateWithOwner:self options:nil][0];
    self.frame = contentView.bounds;
    [self.contentView addSubview:contentView];
}

@end
