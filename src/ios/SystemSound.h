#import <Cordova/CDVPlugin.h>
#import <Foundation/Foundation.h>

@interface SystemSound : CDVPlugin {
}

- (void)playSound:(CDVInvokedUrlCommand *)command;

@end
