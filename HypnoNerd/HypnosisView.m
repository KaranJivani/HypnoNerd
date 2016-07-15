//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Karan Jivani on 7/12/16.
//  Copyright © 2016 Karan Jivani. All rights reserved.
//

#import "HypnosisView.h"

@interface HypnosisView()

@property(nonatomic,strong) UIColor *circleColor;

@end
@implementation HypnosisView

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    //All Hypnosis view start with clear background color
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect Bounds = [[UIWindow alloc]init].bounds;
    
    //figure out the center of the bounds rectangle
    
    CGPoint center;
    
    center.x = Bounds.origin.x + Bounds.size.width/2.0;
    center.y = Bounds.origin.y + Bounds.size.height/2.0;
    
    /*//The circle will be the largest that will fit in the view
    float radius = MIN(Bounds.size.width, Bounds.size.height)/2;*/
    
    //The largets circle will circumscribe the view
    float maxRadius = hypot(Bounds.size.width, Bounds.size.height)/2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    /*//Add and arc to path at center with radius of radius from 0 to 2*PI radians(a circle)
    [path addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI*2.0 clockwise:YES];*/
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius = currentRadius-20) {
        
        //Move point to correct spot for each circle
        [path moveToPoint:CGPointMake(center.x+currentRadius, center.y)];
        
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI*2.0 clockwise:YES];

    }
    
    //configure the drawing color to light gray
    [self.circleColor setStroke];
    
    //Configure line width to 10 points
    path.lineWidth = 10;
    
    //Draw the line
    [path stroke];
    
//    [self setImageWithName:@"logo.png"];
}


//Bronze challange
-(void)setImageWithName : (NSString *)imageName {
    
    UIImage *logoImage = [UIImage imageNamed:imageName];
    CGRect imageRect = CGRectMake(self.bounds.origin.x,self.bounds.origin.y,self.bounds.size.width,self.bounds.size.height);
    [logoImage drawInRect:imageRect];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%@ was touched",self);
    
    //Get three random numbers between 0 and 1
    
    float red = (arc4random() % 100)/100.0;
    float green = (arc4random() % 100)/100.0;
    float blue = (arc4random() % 100)/100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    [self setCircleColor:randomColor];

}

-(void) setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


@end
