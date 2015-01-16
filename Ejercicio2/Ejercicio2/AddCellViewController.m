//
//  AddCellViewController.m
//  Ejercicio2
//
//  Created by Jonathan Pacheco on 12/20/14.
//  Copyright (c) 2014 Jonathan Pacheco. All rights reserved.
//

#import "AddCellViewController.h"

@interface AddCellViewController ()

@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *subtitleTextField;

@end

@implementation AddCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)addCellAction:(id)sender {
    NSString *title = self.titleTextField.text;
    NSString *subtitle = self.subtitleTextField.text;
    
    [self.delegate addCellWithTitle:title andSubtitle:subtitle];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
