//
//  UIColor+Layout.m
//  Notes
//
//  Created by Andrew Vladislavlev on 27.05.17.
//  Copyright © 2017 Soheil Azarpour. All rights reserved.
//

#import "UIColor+Layout.h"

@implementation UIColor (Layout)

+ (UIColor *)backgroundColor {
  
  UIImage *background = [UIImage imageNamed:@"background"];
  return [UIColor colorWithPatternImage:background];

}

+ (UIColor *)themeColor {
  
  return [UIColor colorWithRed:1.0f green:126.0f/255.0f blue:0.0f alpha:1.0f];
}

@end
