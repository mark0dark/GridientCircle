//
//  MyCircle.m
//  GridientTest
//
//  Created by lwh on 13-5-24.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import "MyCircle.h"

@implementation MyCircle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIGraphicsBeginImageContext(CGSizeMake(100,100));
    CGContextRef imageCtx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(imageCtx, self.frame.size.width/2  , self.frame.size.height/2, 25, 0, 2*M_PI, 0);
    [[UIColor redColor]set];
    
    CGContextSetShadowWithColor(imageCtx, CGSizeMake(0, 0), 2*M_PI/20, [UIColor whiteColor].CGColor);
    
    CGContextSetLineWidth(imageCtx, 10);
    CGContextDrawPath(imageCtx, kCGPathStroke);
    
    
    CGImageRef mask = CGBitmapContextCreateImage(UIGraphicsGetCurrentContext());
    UIGraphicsEndImageContext();
    
    
    CGContextClipToMask(ctx, self.bounds, mask);
    CGImageRelease(mask);
    
    
    CGFloat components[8] = {
        0.0, 0.0, 0.0, 1.0,
        1.0, 1.0, 1.0, 1.0 };
    
    CGColorSpaceRef cg = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(cg, components, NULL, 2);
    CGColorSpaceRelease(cg), cg = NULL;
    
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(100, 100);
    
    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient), gradient = NULL;
}

@end
