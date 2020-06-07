//
//  PrivateMethods.h
//  AutoLayoutBookSampler
//
//  Created by Yusuke Kawanabe on 12/10/15.
//  Copyright © 2015 Yusuke Kawanabe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject ()
- (NSString *)_ivarDescription;
@end

@interface UIView ()
- (NSString *)recursiveDescription;
- (NSString *)_autolayoutTrace;
@end

@interface UIViewController ()
- (NSString *)_printHierarchy;
@end