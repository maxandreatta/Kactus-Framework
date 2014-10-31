//
//  UIImagePickerController+NonRotating.h
//  Kactus
//
//  Created by Andreatta Massimiliano on 09/10/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImagePickerController (NonRotating)

- (BOOL)shouldAutorotate;
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation;

@end
