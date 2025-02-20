#import <Foundation/Foundation.h>

@interface IOSPlugin : NSObject


@end

@implementation IOSPlugin
NSDate *creationDate;
static IOSPlugin *_sharedInstance;


+(IOSPlugin *) sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[IOSPlugin alloc] init];
    });
    return _sharedInstance;
}

-(id) init{
    self = [super init];
    if(self)
        [self initHelper];
    
    return self;
}

-(void) initHelper{
    NSLog(@"InitHelper called");
    creationDate = [NSDate date];
   
}

-(double) getElapsedTime
{
    return [[NSDate date] timeIntervalSinceDate:creationDate];
}

@end

extern "C"
{
    

    
}
