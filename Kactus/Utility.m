#import "Utility.h"

@implementation Utility

+(BOOL) validateEmail: (NSString *) email 
{
	NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
	BOOL isValid = [emailTest evaluateWithObject:email];
	return isValid;
}

+(BOOL) validatePassword: (NSString *) password
{
    // Tra 8 e 10 caratteri, almeno 1 maiuscola, almeno 1 minuscola e almeno un numero
    NSCharacterSet *lowerCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    
    NSCharacterSet *upperCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLKMNOPQRSTUVWXYZ"];
    
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    if (!(password.length >7 && password.length < 11))
    {
        return false;
    }
    
    if ([password rangeOfCharacterFromSet:lowerCaseChars].location == NSNotFound || [password rangeOfCharacterFromSet:upperCaseChars].location == NSNotFound
        || [password rangeOfCharacterFromSet:numbers].location == NSNotFound) {
        return false;
    }
    else
        return true;
}

+(NSString*) dictToJSONString:(NSDictionary*) dict {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    if (!jsonData) {
        NSLog(@"JSON error: %@", error);
    } else {
        
        NSString *JSONString = [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];
        NSLog(@"JSON OUTPUT: %@",JSONString);
        return JSONString;
    }
    return  nil;
}

+(NSMutableDictionary*) JSONStringtoDictionary:(NSString*) jsonString {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    if(jsonString.length != 0) {
        NSMutableDictionary *myDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        if(!myDictionary) {
            NSLog(@"%@",error);
            return  nil;
        } else {
            return myDictionary;
        }
    } else {
        NSLog(@"ricevuta stringa vuota");
        return  nil;
    }
}

+(NSMutableArray*) JSONStringtoArray:(NSString*) jsonString {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    if(jsonString.length != 0) {
        NSMutableArray *arrayNewsByString = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        if(!arrayNewsByString) {
            NSLog(@"%@",error);
            return  nil;
        } else {
            return arrayNewsByString;
        }
    } else {
        NSLog(@"ricevuta stringa vuota");
        return  nil;
    }
}

+ (void)showActivityIndicatorToView:(UIView*)view withType:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle {
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:activityIndicatorViewStyle];
    
    activityView.center = view.center;
    
    CGRect viewFrame = view.frame;
    CGRect activityViewFrame = activityView.frame;
    activityViewFrame.origin.x = (viewFrame.size.width / 2) - (activityView.frame.size.width / 2);
    activityViewFrame.origin.y = (viewFrame.size.height / 2) - (activityView.frame.size.height / 2);
    activityView.frame = activityViewFrame;
    
    [activityView startAnimating];
    [view addSubview:activityView];
}

+ (void) hideActivityIndicator:(UIView*)view {
    UIView *activityView;
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
	for (UIView *subview in subviewsEnum) {
		if ([subview isKindOfClass:[UIActivityIndicatorView class]]) {
			activityView = subview;
            break;
		}
	}
    if(activityView) {
        [activityView removeFromSuperview];
        activityView = nil;
    }
}

+ (UIImageView*)showCustomIndicator:(UIView*)view {
    UIImageView* imageLoadingFrame = [[UIImageView alloc] initWithFrame:view.bounds];
    NSMutableArray* arrayTempImage = [NSMutableArray array];
    for (int iIndex = 0; iIndex < 8; iIndex++) {
        NSString *nameImage = [NSString stringWithFormat:@"%04i", iIndex];
        nameImage = [NSString stringWithFormat:@"loader_%@", nameImage];
        [arrayTempImage addObject:[UIImage imageNamed:nameImage]];
    }
    imageLoadingFrame.animationDuration = 1;
    imageLoadingFrame.contentMode = UIViewContentModeCenter;
    // imageLoadingFrame.backgroundColor = [UIColor colorWithHexString:@"FFFFFF" alpha:0.5];
    imageLoadingFrame.animationImages = [NSArray arrayWithArray:arrayTempImage];
    return imageLoadingFrame;
}

+ (NSString*)truncateString:(NSString *)stringToTruncate after:(int)maxRange {
    NSRange stringRange = {0, MIN([stringToTruncate length], maxRange)};
    stringRange = [stringToTruncate rangeOfComposedCharacterSequencesForRange:stringRange];
    NSString *shortString = [stringToTruncate substringWithRange:stringRange];
    if([stringToTruncate length] > maxRange)
        shortString = [NSString stringWithFormat:@"%@...", shortString];
    return shortString;
}

+ (void)addGradientViewToBackView:(UIView*)viewParent withFrame:(CGRect)frameGradientView colors:(NSArray*)arrayColors andGradientLocation:(NSArray*)arrayGradientLocation {
    
    UIView *viewGradient = [[UIView alloc] initWithFrame:frameGradientView];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.opacity = 1;
    gradient.frame = viewGradient.bounds;
    gradient.colors = arrayColors;
    gradient.locations = arrayGradientLocation;
    viewGradient.userInteractionEnabled = NO;
    [viewGradient.layer insertSublayer:gradient atIndex:0];

    [[viewParent superview] insertSubview:viewGradient belowSubview:viewParent];
    
}

/*
+ (id)applyShadow:(id)elementToWhichToApply {
    if([elementToWhichToApply class] == [UILabel class]) {
        UILabel *labelToEdit = elementToWhichToApply;
        labelToEdit.layer.shadowOpacity = 0.3;
        labelToEdit.layer.shadowRadius = 0.3;
        labelToEdit.layer.shadowOffset = CGSizeMake(0.0, 1.1);
        labelToEdit.layer.shouldRasterize = TRUE;
        labelToEdit.layer.shadowColor = [UIColor blackColor].CGColor;
        return labelToEdit;
    } else {
        return elementToWhichToApply;
    }
}
 */

@end
