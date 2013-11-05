//
//  APRevealTableViewCell.h
//  APRevealTableViewCell
//
//  Created by Andreas Petrov on 05/11/13.
//  Copyright (c) 2013 Andreas Petrov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APRevealTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *leftDrawerContent;
@property (weak, nonatomic) IBOutlet UIView *rightDrawerContent;

@end
