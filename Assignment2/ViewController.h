//
//  ViewController.h
//  Assignment2
//
//  Created by Jay Gadi on 3/12/14.
//  Copyright (c) 2014 Jay Gadi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController
{
    
}

//initialize button and text field variables
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIButton *decimalButton;
@property (strong, nonatomic) IBOutlet UIButton *binaryButton;
@property (strong, nonatomic) IBOutlet UIButton *hexButton;

//create click listeners for buttons
- (IBAction)doDecimalButton:(id)sender;
- (IBAction)doBinaryButton:(id)sender;
- (IBAction)doHexButton:(id)sender;




@end
