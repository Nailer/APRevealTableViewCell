//
//  APRevealTableViewCell.m
//  APRevealTableViewCell
//
//  Created by Andreas Petrov on 05/11/13.
//  Copyright (c) 2013 Andreas Petrov. All rights reserved.
//

#import "APRevealTableViewCell.h"

@interface APRevealTableViewCell()

@property (strong, nonatomic) UIPanGestureRecognizer *panGestureRecognizer;

@property (nonatomic) APRevealTableViewCellSwipeDirection initialSwipeDirection;

@end

@implementation APRevealTableViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        [self setup];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self setup];
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]))
    {
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleDidPan:)];
}

#pragma mark - Gesture handling

- (void)handleDidPan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self];

    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        [self setSelected:NO];

        BOOL isInitialPan = self.initialSwipeDirection == APRevealTableViewCellSwipeDirectionNone;
        if (isInitialPan)
        {
            self.initialSwipeDirection = [self initialSwipeDirectionFromTranslation:translation];
            [self setupViewsForPanInDirection:self.initialSwipeDirection];
        }
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged)
    {


    }
    else if (recognizer.state == UIGestureRecognizerStateEnded ||
             recognizer.state == UIGestureRecognizerStateCancelled)
    {

    }
}

- (void)setupViewsForPanInDirection:(APRevealTableViewCellSwipeDirection)direction
{

}

- (APRevealTableViewCellSwipeDirection)initialSwipeDirectionFromTranslation:(CGPoint)translation
{
    if (translation.x > 0)
    {
        return APRevealTableViewCellSwipeDirectionRight;
    }
    else if (translation.x < 0)
    {
        return APRevealTableViewCellSwipeDirectionLeft;
    }

    return APRevealTableViewCellSwipeDirectionNone;
}

#pragma mark - Private

- (BOOL)shouldRevealForSwipeDirection:(APRevealTableViewCellSwipeDirection)direction
{
    NSAssert(direction != APRevealTableViewCellSwipeDirectionNone, @"direction cannot be APRevealTableViewCellSwipeDirectionNone");
    
    UIView *content = [self drawerContentForSwipeDirection:direction];

    return content != nil &&
           [self.delegate respondsToSelector:@selector(revealTableViewCell:shouldRevealForSwipeDirection:)] &&
           [self.delegate revealTableViewCell:self shouldRevealForSwipeDirection:direction];
}

- (UIView *)drawerContentForSwipeDirection:(APRevealTableViewCellSwipeDirection)direction
{
    NSAssert(direction != APRevealTableViewCellSwipeDirectionNone, @"direction cannot be APRevealTableViewCellSwipeDirectionNone");
    return direction == APRevealTableViewCellSwipeDirectionLeft ? self.rightDrawerContentView : self.leftDrawerContentView;
}

- (UIView *)viewToPan
{
    return self.mainContentView ? self.mainContentView : [self.contentView.subviews lastObject];
}

@end

@implementation APRevealTableViewCell(SubclassingHooks)

- (void)revealRatioDidChange:(CGFloat)revealRatio forDrawerContentView:(UIView *)contentView
{
    // Default impl does nothing.
}

@end
