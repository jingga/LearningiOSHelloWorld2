//
//  ViewController.m
//  LearningiOSHelloWorld2
//
//  Created by Bambang Lestari on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tipLabel, totalAmountTextField;

-(IBAction)calculateButton_Clicked:(id)sender
{
    float amount = [self.totalAmountTextField.text floatValue];
    float tip = (amount * 10)/100;
    self.tipLabel.text = [NSString stringWithFormat:@"¥%.2f",tip];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder]; 
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)replacementString
{
	NSLog(@">>> Entering %s <<<", __PRETTY_FUNCTION__);
	
	BOOL shouldReplace = YES;
	
	NSString *oldString = [textField text];
	NSString *newString = [oldString stringByReplacingCharactersInRange:range withString:replacementString];
	
	NSLog(@"Old string: >>>%@<<<", oldString);
	NSLog(@"New string: >>>%@<<<", newString);
	
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	[formatter setNumberStyle:NSNumberFormatterDecimalStyle];
	
	NSNumber *number = [formatter numberFromString:newString];
	
	if (number == nil)
	{
		if ([newString length] == 0)			// Field can be empty
		{
			shouldReplace = YES;
		}
		else
		{
			if (![newString isEqualToString:[formatter decimalSeparator]])		// Leading decimal
			{
				shouldReplace = NO;
			}
		}
	}
	
	[formatter release], formatter = nil;
	
	NSLog(@"<<< Leaving %s >>>", __PRETTY_FUNCTION__);
	return shouldReplace;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
