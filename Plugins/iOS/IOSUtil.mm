# import <Foundation/Foundation.h>
# import <UIKit/UIKit.h>

extern UIViewController *UnityGetGLViewController();

@interface IOSUtil : NSObject

@end

@implementation IOSUtil

+(void)showAlertWithTitle:(NSString *)title message:(NSString *)msg{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                        message:msg
                        preferredStyle:UIAlertControllerStyleActionSheet];
     
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                            style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * action) {}];
     
    [alert addAction:defaultAction];
    [UnityGetGLViewController() presentViewController:alert animated:YES completion:nil];
}

+(void)closeAlert:(NSTimer *)timer {
    UIAlertController *alert = (UIAlertController *)timer.userInfo;
    [alert dismissViewControllerAnimated:YES completion:nil];
}

+(void)showToastWithMessage:(NSString *)msg{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                        message:msg
                        preferredStyle:UIAlertControllerStyleActionSheet];
    
    [UnityGetGLViewController() presentViewController:alert animated:YES completion:^{
        [NSTimer scheduledTimerWithTimeInterval:3.0
                                         target:self
                                       selector:@selector(closeAlert:)
                                       userInfo:alert
                                        repeats:NO];
    }];
}


@end

extern "C"
{
void ShowAlert(const char *title,const char *message)
    {
        [IOSUtil showAlertWithTitle:[NSString stringWithUTF8String:title] message:[NSString stringWithUTF8String:message]];
    }
    
void ShowToast(const char *message, const double timer)
    {
        [IOSUtil showToastWithMessage:[NSString stringWithUTF8String:message]];
    }
}
