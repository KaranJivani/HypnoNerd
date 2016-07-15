//
//  ViewController.m
//  HypnoNerd
//
//  Created by Karan Jivani on 7/14/16.
//  Copyright © 2016 Karan Jivani. All rights reserved.
//

#import "ViewController.h"
#import "HypnosisView.h"
@interface ViewController ()

@end

@implementation ViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        //Set the tabbar item's title
        self.tabBarItem.title = @"Hypnotize";
        //Create a UIImage from a file
        UIImage *img = [UIImage imageNamed:@"Hypno.png"];
        //Put that image on the tab bar item
        self.tabBarItem.image = img;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@ loaded",self);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView {
    //Creare a view
    HypnosisView *backgroundView = [[HypnosisView alloc]init];
    
    //set it as the view of this view controller
    self.view = backgroundView;
    
    CGRect textfieldRect = CGRectMake(95, 70, 240, 30);
    UITextField *textField = [[UITextField alloc]initWithFrame:textfieldRect];
    
    //setting the borderstyle for textfield
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize you";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    [self.view addSubview:textField];
    
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField {
    NSLog(@"%@",textField.text);
    return YES;
}


@end
