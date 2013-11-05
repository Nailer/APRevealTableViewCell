//
//  APRevealTableViewCell.h
//  APRevealTableViewCell
//
//  Created by Andreas Petrov on 05/11/13.
//  Copyright (c) 2013 Andreas Petrov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol APRevealTableViewCellDelegate;

@interface APRevealTableViewCell : UITableViewCell

typedef enum
{
    APRevealTableViewCellSwipeDirectionNone = 0,
    APRevealTableViewCellSwipeDirectionLeft = UISwipeGestureRecognizerDirectionLeft,
    APRevealTableViewCellSwipeDirectionRight = UISwipeGestureRecognizerDirectionRight,
} APRevealTableViewCellSwipeDirection;

/**
 The view to move when swiping the cell.
 If nil, [self.contentView.subviews lastObject] is used
 */
@property (strong, nonatomic) IBOutlet UIView *mainContentView;

/**
 The view to display in the left drawer, which is revealed upon a swipe with APRevealTableViewCellSwipeDirectionRight
 Set programmatically, or by connecting the outlet to a root-level view in a .xib
 */
@property (strong, nonatomic) IBOutlet UIView *leftDrawerContentView;

/**
 The view to display in the right drawer, which is revealed upon a swipe with APRevealTableViewCellSwipeDirectionLeft
 Set programmatically, or by connecting the outlet to a root-level view in a .xib
 */
@property (strong, nonatomic) IBOutlet UIView *rightDrawerContentView;


@property (weak, nonatomic) id <APRevealTableViewCellDelegate> delegate;

@end

@interface APRevealTableViewCell(SubclassingHooks)

/**
 Override in subclasses to react to changes in the reveal ratio.
 Can be useful for adjusting the content in the drawers to the reveal ratio. For example fading in views by assigning revealRatio to alpha.
 contentView is either leftDrawerContentView during a swipe to the right, or rightDrawerContentView during a swipe to the left
 */
- (void)revealRatioDidChange:(CGFloat)revealRatio forDrawerContentView:(UIView*)contentView;

@end

@protocol APRevealTableViewCellDelegate <NSObject>

@optional

/**
 Asks the delegate if a swipe in the given direction should actually initiate a reveal
 */
- (BOOL)revealTableViewCell:(APRevealTableViewCell *)tableViewCell shouldRevealForSwipeDirection:(APRevealTableViewCellSwipeDirection)direction;

/**
 Called right before a reveal in the given direction is initiated
 */
- (void)revealTableViewCell:(APRevealTableViewCell *)tableViewCell willRevealForSwipeDirection:(APRevealTableViewCellSwipeDirection)direction;

/**
 Called right after a reveal in the given direction has finished
 */
- (void)revealTableViewCell:(APRevealTableViewCell *)tableViewCell didRevealForSwipeDirection:(APRevealTableViewCellSwipeDirection)direction;

@end