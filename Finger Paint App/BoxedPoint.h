//
//  BoxedPoint.h
//  Finger Paint App
//
//  Created by Adam Goldberg on 2015-10-09.
//  Copyright (c) 2015 Adam Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoxedPoint : NSObject

@property (nonatomic) CGPoint currentLoc;

@property (nonatomic) CGPoint previousLoc;

@property (nonatomic, strong) UIColor *lineColor;

@end
