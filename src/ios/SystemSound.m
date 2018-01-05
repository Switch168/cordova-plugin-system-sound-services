#import "SystemSound.h"
#import <Cordova/CDVAvailability.h>

@import AVFoundation;

@interface SystemSound () <AVAudioPlayerDelegate>

@property (strong, nonatomic) AVAudioSession *audioSession;
@property (strong, nonatomic) AVAudioPlayer *player;

@end

@implementation SystemSound

- (void)pluginInitialize {}

- (void)playSound:(CDVInvokedUrlCommand *)command {
    
    NSString* fullFileName = [command.arguments objectAtIndex:0];
    NSString* searchInDirectory = [command.arguments objectAtIndex:1];
    NSString* fileName = [[fullFileName lastPathComponent] stringByDeletingPathExtension];
    NSString* extension = [fullFileName pathExtension];
    NSString* audioPath;
    if (( ![searchInDirectory isEqual:[NSNull null]] ) && ( [searchInDirectory length] != 0 ) ) {
        audioPath = [[NSBundle mainBundle] pathForResource:fileName ofType:extension inDirectory:searchInDirectory];
    } else {
        audioPath = [[NSBundle mainBundle] pathForResource:fileName ofType:extension];
    }
    if (!audioPath) {
        // File not found.
        return;
    }
    NSURL *audioUrl = [NSURL fileURLWithPath:audioPath];
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:audioUrl error:nil];
    self.player.delegate = self;
    [self.player setVolume: 1.0];
    [self.player prepareToPlay];
    [self.player play];
}

@end
