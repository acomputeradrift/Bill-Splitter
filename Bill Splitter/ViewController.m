//
//  ViewController.m
//  Bill Splitter
//
//  Created by Jamie on 2018-08-12.
//  Copyright © 2018 Jamie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billToSplit;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeople;
@property (weak, nonatomic) IBOutlet UILabel *eachPersonPays;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPeopleDisplay;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.billToSplit.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.numberOfPeople.minimumValue = 2;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (IBAction)calculateBillPortions:(id)sender {
//    [self.billToSplit resignFirstResponder];
//    NSDecimalNumber *billAmount = [NSDecimalNumber decimalNumberWithString: self.billToSplit.text];
////    float billAmount = [self.billToSplit.text
////                        intValue];
//    NSDecimalNumber *nuOfPeople = [[NSDecimalNumber alloc] initWithFloat:(self.numberOfPeople.value)];
//    NSDecimalNumber *eachPortion = [billAmount decimalNumberByDividingBy:nuOfPeople];
//
//    NSString *eachPortionString = [NSString stringWithFormat:@"Each person pays: $%@", eachPortion];
//    self.eachPersonPays.text =  eachPortionString;
//}
- (IBAction)sliderUpdates:(id)sender {
    
    NSString *noOfPeopleDisplay = [NSString stringWithFormat:@"%.00f", self.numberOfPeople.value];
    self.numberOfPeopleDisplay.text = noOfPeopleDisplay;
    
    NSDecimalNumber *billAmount = [NSDecimalNumber decimalNumberWithString: self.billToSplit.text];
    //    float billAmount = [self.billToSplit.text
    //                        intValue];
    NSDecimalNumber *nuOfPeople = [[NSDecimalNumber alloc] initWithFloat:(self.numberOfPeople.value)];
    NSDecimalNumber *eachPortion = [billAmount decimalNumberByDividingBy:nuOfPeople];
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setMinimumFractionDigits:2];
    NSString *eachPortionString = [formatter stringFromNumber:eachPortion];
    self.eachPersonPays.text =  eachPortionString;
}



@end
