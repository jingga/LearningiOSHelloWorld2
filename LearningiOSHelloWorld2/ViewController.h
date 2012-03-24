//
//  ViewController.h
//  LearningiOSHelloWorld2
//
//  Created by Bambang Lestari on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *totalAmountTextField;
    IBOutlet UILabel *tipLabel;
}

-(IBAction)calculateButton_Clicked:(id)sender;


@property (nonatomic,retain) IBOutlet UITextField *totalAmountTextField;
@property (nonatomic,retain) IBOutlet UILabel *tipLabel;

@end
