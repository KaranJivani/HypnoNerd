//
//  KRNRemainderViewController.m
//  HypnoNerd
//
//  Created by Karan Jivani on 7/14/16.
//  Copyright © 2016 Karan Jivani. All rights reserved.
//

#import "KRNRemainderViewController.h"

@interface KRNRemainderViewController ()

@property(nonatomic,weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation KRNRemainderViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        //Set the tabbar item's title
        self.tabBarItem.title = @"Remainder";
        //Create a UIImage from a file
        UIImage *img = [UIImage imageNamed:@"Time.png"];
        //Put that image on the tab bar item
        self.tabBarItem.image = img;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@ loaded",self);
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)addRemainder:(id)sender {
    
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a remainder for %@",date);
    
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    localNotification.alertBody = @"Hypnotize you";
    localNotification.fireDate = date;
    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
}

@end
