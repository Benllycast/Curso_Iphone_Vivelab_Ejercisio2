//
//  DetailViewController.m
//  Ejercicio2
//
//  Created by Jonathan Pacheco on 12/20/14.
//  Copyright (c) 2014 Jonathan Pacheco. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailLabel.text = [NSString stringWithFormat:@"Seccionado el número %lu", self.selectedIndex];
}

@end
