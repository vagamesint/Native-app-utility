#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IOSAppSettingsUtil : NSObject

@end

@implementation IOSAppSettingsUtil
    +(void)openSettings{
        NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];

        [[UIApplication sharedApplication] openURL:url
                                           options:@{}
                                 completionHandler:nil];
    }
@end

extern "C"
{
    void Open()
    {
        [IOSAppSettingsUtil openSettings];
    }
}