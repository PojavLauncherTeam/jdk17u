#import <AVFAudio/AVFAudio.h>

#if TARGET_OS_IPHONE
void DAUDIO_RequestRecordPermission() {
  AVAudioSession *session = AVAudioSession.sharedInstance;
  if ([session respondsToSelector:@selector(requestRecordPermission:)]) {
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    [session requestRecordPermission:^(BOOL granted) {
      dispatch_group_leave(group);
    }];
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
  }
}
#endif
