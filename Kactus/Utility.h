#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utility : NSObject

+ (BOOL) validateEmail:(NSString *)email;
+ (BOOL) validatePassword:(NSString *)password;
+ (void) showActivityIndicatorToView:(UIView*)view withType:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle;
+ (void) hideActivityIndicator:(UIView*)view;
+ (UIImageView*) showCustomIndicator:(UIView*)view;
+ (NSString*) dictToJSONString:(NSDictionary*)dict;
+ (NSMutableDictionary*) JSONStringtoDictionary:(NSString*)jsonString;
+ (NSMutableArray*) JSONStringtoArray:(NSString*)jsonString;
+ (NSString*) truncateString:(NSString *)stringToTruncate after:(int)maxRange;
+ (UIView*)addGradientViewToBackView:(UIView*)viewParent withFrame:(CGRect)frameGradientView colors:(NSArray*)arrayColors andGradientLocation:(NSArray*)arrayGradientLocation;

@end
