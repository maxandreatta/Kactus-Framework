//
//  UIImage+Utility.m
//  Kactus
//
//  Created by Andreatta Massimiliano on 15/07/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import "UIImage+Utility.h"
#import "UIColor+Utility.h"

@import ImageIO; // to do the actual work
@import MobileCoreServices; // for the type defines

@implementation UIImage (Utility)

+ (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

+ (UIImage *) getCachedImage: (NSString *) ImageURLString
{
    NSString *filename = [ImageURLString lastPathComponent];
    NSString *uniquePath = [TMP stringByAppendingPathComponent: filename];
    
    UIImage *image;
    
    // Check for a cached version
    if([[NSFileManager defaultManager] fileExistsAtPath: uniquePath])
    {
        image = [UIImage imageWithContentsOfFile: uniquePath]; // this is the cached image
    }
    else
    {
        // get a new one
        [UIImage cacheImage: ImageURLString];
        image = [UIImage imageWithContentsOfFile: uniquePath];
    }
    
    return image;
}

+ (void) cacheImage: (NSString *) ImageURLString
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Fetch the desired source image by making a network request
        NSURL *ImageURL = [NSURL URLWithString: ImageURLString];
        
        // Generate a unique path to a resource representing the image you want
        NSString *filename = [ImageURLString lastPathComponent];
        
        NSString *uniquePath = [TMP stringByAppendingPathComponent: filename];
        
        // Check for file existence
        if(![[NSFileManager defaultManager] fileExistsAtPath: uniquePath])
        {
            // The file doesn't exist, we should get a copy of it
            
            // Fetch image
            NSData *data = [[NSData alloc] initWithContentsOfURL: ImageURL];
            UIImage *image = [[UIImage alloc] initWithData: data];
            
            // Is it PNG or JPG/JPEG?
            // Running the image representation function writes the data from the image to a file
            if([ImageURLString rangeOfString: @".png" options: NSCaseInsensitiveSearch].location != NSNotFound)
            {
                [UIImagePNGRepresentation(image) writeToFile: uniquePath atomically: YES];
            }
            else if(
                    [ImageURLString rangeOfString: @".jpg" options: NSCaseInsensitiveSearch].location != NSNotFound ||
                    [ImageURLString rangeOfString: @".jpeg" options: NSCaseInsensitiveSearch].location != NSNotFound
                    )
            {
                [UIImageJPEGRepresentation(image, 100) writeToFile: uniquePath atomically: YES];
            }
        }
    });
    
}

+ (NSString *)contentTypeForImageData:(NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    
    switch (c) {
        case 0xFF:
            return @"image/jpeg";
        case 0x89:
            return @"image/png";
        case 0x47:
            return @"image/gif";
        case 0x49:
        case 0x4D:
            return @"image/tiff";
    }
    return nil;
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage*)tinteggia: (UIImage *)image rosso:(float)r verde:(float)g blu:(float)b alpha:(float)a
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    CGRect imageRect = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx,r / 255.0, g / 255.0, b / 255.0, a);
    CGContextFillRect(ctx, imageRect);
    [image drawInRect:imageRect blendMode:kCGBlendModeDestinationIn alpha:a];
    UIImage* outImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outImage;
}

+ (UIImage*)tinteggia:(UIImage *)image fromColor:(UIColor*)colorReceveid withAlpha:(CGFloat)a
{
    
    CGFloat r;
    CGFloat g;
    CGFloat b;
    
    CGFloat components[3];
    
    [UIColor getRGBComponents:components forColor:colorReceveid];
    
    r = components[0] * 255;
    g = components[1] * 255;
    b = components[2] * 255;
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    CGRect imageRect = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx,r / 255.0, g / 255.0, b / 255.0, a);
    CGContextFillRect(ctx, imageRect);
    [image drawInRect:imageRect blendMode:kCGBlendModeDestinationIn alpha:a];
    UIImage* outImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outImage;
}

+ (UIImage *) imageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    //  [[UIColor colorWithRed:222./255 green:227./255 blue: 229./255 alpha:1] CGColor]) ;
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *) image:(UIImage *)image withMaskColor:(UIColor *)color
{
    UIImage *formattedImage = [image imageWithWhiteBackground];
    
    CGRect rect = {0, 0, formattedImage.size.width, formattedImage.size.height};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *tempColor = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGImageRef maskRef = [formattedImage CGImage];
    CGImageRef maskcg = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                          CGImageGetHeight(maskRef),
                                          CGImageGetBitsPerComponent(maskRef),
                                          CGImageGetBitsPerPixel(maskRef),
                                          CGImageGetBytesPerRow(maskRef),
                                          CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef maskedcg = CGImageCreateWithMask([tempColor CGImage], maskcg);
    CGImageRelease(maskcg);
    UIImage *result = [UIImage imageWithCGImage:maskedcg];
    CGImageRelease(maskedcg);
    
    return result;
}

- (UIImage *) imageWithWhiteBackground
{
    UIImage *negative = [self negativeImage];
    
    UIGraphicsBeginImageContext(negative.size);
    CGContextSetRGBFillColor (UIGraphicsGetCurrentContext(), 1, 1, 1, 1);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size.width = negative.size.width;
    thumbnailRect.size.height = negative.size.height;
    
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0.0, negative.size.height);
    CGContextScaleCTM(UIGraphicsGetCurrentContext(), 1.0, -1.0);
    CGContextFillRect(UIGraphicsGetCurrentContext(), thumbnailRect);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), thumbnailRect, negative.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *) negativeImage
{
    UIGraphicsBeginImageContext(self.size);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeCopy);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeDifference);
    CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(),[UIColor whiteColor].CGColor);
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, self.size.width, self.size.height));
    UIImage *negativeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return negativeImage;
}


+ (UIImage *) convertBitmapRGBA24ToUIImage:(unsigned char *)bits withSize:(CGSize)size {
    
    @autoreleasepool
    {
        char* rgba = (char*)malloc(size.width*size.height*4);
        
        for(int i=0; i < size.width*size.height; ++i) {
            rgba[4*i] = bits[3*i];
            rgba[4*i+1] = bits[3*i+1];
            rgba[4*i+2] = bits[3*i+2];
            rgba[4*i+3] = 255;
        }
        
        
        size_t bufferLength = size.width * size.height * 4;
        CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, rgba, bufferLength, NULL);
        size_t bitsPerComponent = 8;
        size_t bitsPerPixel = 32;
        size_t bytesPerRow = 4 * size.width;
        
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        if(colorSpaceRef == NULL) {
            NSLog(@"Error allocating color space");
            CGDataProviderRelease(provider);
            return nil;
        }
        
        CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
        CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
        
        CGImageRef iref = CGImageCreate(size.width,
                                        size.height,
                                        bitsPerComponent,
                                        bitsPerPixel,
                                        bytesPerRow,
                                        colorSpaceRef,
                                        bitmapInfo,
                                        provider,   // data provider
                                        NULL,       // decode
                                        YES,            // should interpolate
                                        renderingIntent);
        
        uint32_t* pixels = (uint32_t*)malloc(bufferLength);
        
        if(pixels == NULL) {
            NSLog(@"Error: Memory not allocated for bitmap");
            CGDataProviderRelease(provider);
            CGColorSpaceRelease(colorSpaceRef);
            CGImageRelease(iref);
            return nil;
        }
        
        CGContextRef context = CGBitmapContextCreate(pixels,
                                                     size.width,
                                                     size.height,
                                                     bitsPerComponent,
                                                     bytesPerRow,
                                                     colorSpaceRef,
                                                     bitmapInfo);
        
        if(context == NULL) {
            NSLog(@"Error context not created");
            free(pixels);
        }
        
        UIImage *image = nil;
        if(context) {
            
            CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, size.width, size.height), iref);
            
            CGImageRef imageRef = CGBitmapContextCreateImage(context);
            
            // Support both iPad 3.2 and iPhone 4 Retina displays with the correct scale
            if([UIImage respondsToSelector:@selector(imageWithCGImage:scale:orientation:)]) {
                float scale = [[UIScreen mainScreen] scale];
                image = [UIImage imageWithCGImage:imageRef scale:scale orientation:UIImageOrientationUp];
            } else {
                image = [UIImage imageWithCGImage:imageRef];
            }
            
            CGImageRelease(imageRef);
            CGContextRelease(context);
        }
        
        CGColorSpaceRelease(colorSpaceRef);
        CGImageRelease(iref);
        CGDataProviderRelease(provider);
        
        free(pixels);
        free(rgba);
        
        return image;
    }
}

@end
