//
//  FingerTouchView.m
//  Finger Paint App
//
//  Created by Adam Goldberg on 2015-10-09.
//  Copyright (c) 2015 Adam Goldberg. All rights reserved.
//

#import "FingerTouchView.h"
#import "BoxedPoint.h"

@interface FingerTouchView ()

@property (nonatomic, strong) NSMutableArray *touchesToDraw;
@property (nonatomic, strong) UIColor *customColor;

//@property (nonatomic, strong) BoxedPoint *boxPoint;

@end

@implementation FingerTouchView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.touchesToDraw = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Get our canvas
    CGContextRef canvas = UIGraphicsGetCurrentContext();

    // Begin a new path (Telling the system to draw everything between Begin and Close Path)
    
    CGContextSetLineWidth(canvas, 5.0);
    
    for (BoxedPoint *newItem in self.touchesToDraw) {
        CGContextBeginPath(canvas);
        CGContextSetStrokeColorWithColor(canvas, newItem.lineColor.CGColor);
        CGContextMoveToPoint(canvas, newItem.currentLoc.x, newItem.currentLoc.y);
        CGContextAddLineToPoint(canvas, newItem.previousLoc.x, newItem.previousLoc.y);
        
        
        NSLog(@"Previos:  %@, Current:  %@", NSStringFromCGPoint(newItem.previousLoc), NSStringFromCGPoint(newItem.currentLoc));
        CGContextDrawPath(canvas, kCGPathStroke);
    }
    
    
    
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currentLoc = [touch locationInView:self];
    CGPoint previousLoc = [touch previousLocationInView:self];
    BoxedPoint *bp = [BoxedPoint new];
    bp.previousLoc = previousLoc;
    bp.currentLoc = currentLoc;
    bp.lineColor = self.customColor;
    [self.touchesToDraw addObject:bp];
    [self setNeedsDisplay];
}


//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    [super touchesBegan:touches withEvent:event];
//    NSLog(touches);
//}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}

//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
//    [super touchesCancelled:touches withEvent:event];
//    NSLog(@"Touches");
//    
//}

-(void)setCustomColourString:(NSString *)customColourString
{
    NSString *lowCustomColor = [customColourString lowercaseString];
    NSString *selectorColor = [lowCustomColor stringByAppendingString:@"Color"];
    UIColor *myColor = [UIColor performSelector: NSSelectorFromString(selectorColor)];
    self.customColor = myColor;



    
//   Now to make the different colors work is very simple. The issue is this. When you switch colors and start drawing drawRect is called and it loops through all the data points again applying the new color. So, the solution is simple. What you do is add a property to your object that saves the locations. Make it a UIColor. Grab it from the color property in your custom view (this changes with the seg). Set a default one to red or whatever in the initializer of the UIView. Now in the for loop of drawRect use that color object saved along with the data points!

    
    
//    if ([customColourString isEqualToString:@"Red"]) {
//        self.customColor = [UIColor redColor];
//    }
//    else if ([customColourString isEqualToString:@"Blue"]) {
//        self.customColor = [UIColor blueColor];
//    }
    
//    [self setNeedsDisplay];
}





@end
