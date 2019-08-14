

#import "SignaModule.h"
#import <UIKit/UIKit.h>


#import "SignController.h"
#import "WXComponentManager.h"
#import "WXConvert.h"
#import <WeexPluginLoader/WeexPluginLoader.h>

@interface SignaModule()



@property(nonatomic,copy)WXModuleKeepAliveCallback callback;
@end

WX_PlUGIN_EXPORT_MODULE(sign, SignaModule)
@implementation SignaModule
@synthesize weexInstance;
WX_EXPORT_METHOD(@selector(open:))

-(void)open:(WXModuleCallback)callback
{
    SignController *v = [[SignController alloc] init];
    v.callback = callback;
    [weexInstance.viewController.navigationController pushViewController:v animated:YES];
}

@end

