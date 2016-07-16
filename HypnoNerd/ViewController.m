//
//  ViewController.m
//  HypnoNerd
//
//  Created by Karan Jivani on 7/14/16.
//  Copyright © 2016 Karan Jivani. All rights reserved.
//

#import "ViewController.h"
#import "HypnosisView.h"
@interface ViewController ()<UITextFieldDelegate>

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
    
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

-(void)drawHypnoticMessage: (NSString *)message {
    for (int i = 0; i<20; i++) {
        UILabel *messageLabel = [[UILabel alloc]init];
        
        //configure's the label's color and text
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor redColor];
        messageLabel.text = message;
        
        //This method resizes the label, which will be relative to text that it is displaying
        [messageLabel sizeToFit];
        
        //Get the random x value that fits within the hypnosis view's width
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random()%width;
        
        //Get the random y value that fits within the hypnosis view's height
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random()%height;
        
        //update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin =  CGPointMake(x, y);
//        frame.size.height = 30;
//        frame.size.width = 200;
        messageLabel.frame = frame;
        
        [self.view addSubview:messageLabel];
        
    }
}

@end
