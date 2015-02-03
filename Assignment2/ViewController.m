//
//  ViewController.m
//  Assignment2
//
//  Created by Jay Gadi on 3/12/14.
//  Copyright (c) 2014 Jay Gadi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//synthesie buttons and textfields

@synthesize decimalButton;
@synthesize binaryButton;
@synthesize hexButton;
@synthesize textField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //initializes hex button attributes
    [[hexButton layer] setCornerRadius:8.0f];
    [[hexButton layer] setMasksToBounds:YES];
    [[hexButton layer] setBorderWidth:1.0f];
    [hexButton setBackgroundColor:[UIColor redColor]];
    
    //initializes binary button attributes
    [[binaryButton layer] setCornerRadius:8.0f];
    [[binaryButton layer] setMasksToBounds:YES];
    [[binaryButton layer] setBorderWidth:1.0f];
    [binaryButton setBackgroundColor:[UIColor redColor]];
    
    //initializes decimal button attributes
    [[decimalButton layer] setCornerRadius:8.0f];
    [[decimalButton layer] setMasksToBounds:YES];
    [[decimalButton layer] setBorderWidth:1.0f];
    [decimalButton setBackgroundColor:[UIColor redColor]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//hex button actions
- (IBAction)doHexButton:(id)sender {
    
    //change button colors on click
    [hexButton setBackgroundColor:[UIColor greenColor]];
    [decimalButton setBackgroundColor:[UIColor redColor]];
    [binaryButton setBackgroundColor:[UIColor redColor]];
    
    NSString * text = [textField text];
    
    if([text length] > 2){
        NSString * type = [text substringToIndex: 2];
        NSString * value = [text substringFromIndex:2];
    
        //decimal to hex
        if([type  isEqual: @"d:"]){
            [textField setBackgroundColor:[UIColor whiteColor]];
            NSString * result = [NSString stringWithFormat:@"%lX",(unsigned long)[value integerValue]];
            textField.text = result;
        }
        //hex to hex
        else if ([type isEqual:@"h:"]){
            [textField setBackgroundColor:[UIColor whiteColor]];
            textField.text = value;
        }
        //binary to hex
        else if ([type isEqual:@"b:"]){
            [textField setBackgroundColor:[UIColor whiteColor]];
            unichar binNumber;
            int num = 0;
        
            for (int x= 0; x <[value length]; x++)
            {
                binNumber = [value characterAtIndex: x];
                if (binNumber == '1')
                    num += 1;
                if (x+1 < [value length])
                    num = num<<1;
            }
            NSString * result = [NSString stringWithFormat:@"%lX",(unsigned long)(num)];
            textField.text = result;
        }
        //error check
        else{
            textField.text = @"error";
            [textField setBackgroundColor:[UIColor redColor]];
        
        }
    }
    //error check
    else{
        textField.text = @"error";
        [textField setBackgroundColor:[UIColor redColor]];
    }

}

//binary button actions
- (IBAction)doBinaryButton:(id)sender {
    
    //change button colours on click
    [binaryButton setBackgroundColor:[UIColor greenColor]];
    [decimalButton setBackgroundColor:[UIColor redColor]];
    [hexButton setBackgroundColor:[UIColor redColor]];
    
    NSString * text = [textField text];
    
    if([text length] > 2){
        NSString * type = [text substringToIndex: 2];
        NSString * value = [text substringFromIndex:2];
   
        //decimal to binary
        if([type  isEqual: @"d:"]){
            [textField setBackgroundColor:[UIColor whiteColor]];
            int num = [value intValue];
            int n = log(num)/log(2)+1;
            NSString *result = @"";
    
            for (int j=n; j>=0; j--)
            {
                int power = powl(2,j);
                if (power <= num)
                {
                    num -= power;
                    result = [result stringByAppendingString:@"1"];
                }
                else result = [result stringByAppendingString:@"0"];
            }
            textField.text = result;
        }
        
        //hex to binary
        else if ([type isEqual:@"h:"]){
            [textField setBackgroundColor:[UIColor whiteColor]];
            unsigned num = 0;
            NSScanner * scan = [NSScanner scannerWithString:value];
            [scan scanHexInt: &num];
        
            int n = log(num)/log(2)+1;
            NSString *result = @"";
        
            for (int j=n; j>=0; j--)
            {
                int power = powl(2,j);
                if (power <= num)
                {
                    num -= power;
                    result = [result stringByAppendingString:@"1"];
                }
                else result = [result stringByAppendingString:@"0"];
            }
            textField.text = result;
        }
        //binary to binary
        else if ([type isEqual:@"b:"]){
            [textField setBackgroundColor:[UIColor whiteColor]];
            textField.text = value;
        }
        //error check
        else{
            textField.text = @"error";
            [textField setBackgroundColor:[UIColor redColor]];
        }
    }
    //error check
    else{
        textField.text = @"error";
        [textField setBackgroundColor:[UIColor redColor]];
    }
}
- (IBAction)doDecimalButton:(id)sender {
    
    //change button colours on click
    [decimalButton setBackgroundColor:[UIColor greenColor]];
    [hexButton setBackgroundColor:[UIColor redColor]];
    [binaryButton setBackgroundColor:[UIColor redColor]];
    
    NSString * text = [textField text];
    
    if([text length] > 2){
        NSString * type = [text substringToIndex: 2];
        NSString * value = [text substringFromIndex:2];
    
        //decimal to decimal
        if([type  isEqual: @"d:"]){
            [textField setBackgroundColor:[UIColor whiteColor]];
            textField.text = value;

        }
        //hex to decimal
        else if ([type isEqual:@"h:"]){
            [textField setBackgroundColor:[UIColor whiteColor]];
            unsigned num = 0;
            NSScanner *scan = [NSScanner scannerWithString: value];
            [scan scanHexInt: &num];
            textField.text = [NSString stringWithFormat:@"%i", num];
        
        }
        //binary to decimal
        else if ([type isEqual:@"b:"]){
            [textField setBackgroundColor:[UIColor whiteColor]];
        
            unichar binNumber;
            int num = 0;
        
            for (int x= 0; x <[value length]; x++)
            {
                binNumber = [value characterAtIndex: x];
                if (binNumber == '1')
                    num += 1;
                if (x+1 < [value length])
                    num = num<<1;
            }
        
            textField.text = [NSString stringWithFormat:@"%i", num];
        
        }
        //error checking
        else{
            textField.text = @"error";
            [textField setBackgroundColor:[UIColor redColor]];
        
        }
    }
    //error checking
    else{
        textField.text = @"error";
        [textField setBackgroundColor:[UIColor redColor]];
    }

}
@end
