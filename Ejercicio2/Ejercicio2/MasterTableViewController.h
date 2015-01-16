//
//  MasterTableViewController.h
//  Ejercicio2
//
//  Created by Jonathan Pacheco on 12/20/14.
//  Copyright (c) 2014 Jonathan Pacheco. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MasterTableViewControllerDelegate <NSObject>

- (void)addCellWithTitle:(NSString *)title andSubtitle:(NSString *)subtitle;

@end

@interface MasterTableViewController : UITableViewController<MasterTableViewControllerDelegate>

@end
