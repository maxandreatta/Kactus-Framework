//
//  UIImagePickerController+NonRotating.m
//  Kactus
//
//  Created by Andreatta Massimiliano on 09/10/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import "UIImagePickerController+NonRotating.h"

@implementation UIImagePickerController (NonRotating)

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight;
}

@end
