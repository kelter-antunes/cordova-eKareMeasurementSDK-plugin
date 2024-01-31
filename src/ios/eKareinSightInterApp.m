#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVPluginResult.h>
#import <eKareMeasurementSDK/RNEncryptor.h>
#import <eKareMeasurementSDK/eKareMeasurement.h>

@implementation eKareinSightInterApp

- (void)open:(CDVInvokedUrlCommand*)command {
	[self.commandDelegate runInBackground:^{

    eKareMeasurement *eKareMeasurementObj = [eKareMeasurement new];

    NSString *result = nil;

    NSString *kInterAppId = [command.arguments objectAtIndex:0];
    NSString *kInterAppPW = [command.arguments objectAtIndex:1];
    NSString *kInterAppMeasurementScheme = [command.arguments objectAtIndex:2];
    NSString *kInterAppCallbackScheme = [command.arguments objectAtIndex:3];
    NSString *kInterAppPasteBoardName = [command.arguments objectAtIndex:4];



    NSDictionary *params =@{@"user_role" : @"admin",
                            @"wound_id" : @(-1)};
    [[self eKareMeasurementObj] startMeasurement:params
                                  withCompletion:^(NSDictionary *info, NSError *error) {
      if(error) {
          NSLog(@"Error in measurement: %@", error.description);
          result = @"Error in measurement: %@", error.description;

      }else{
          NSLog(@"Measurement completed: %@", info.description);
          result = @"Measurement completed: %@", info.description;
      }
    }];






    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}];
}


- (void)readMeasurements:(CDVInvokedUrlCommand*)command {
	[self.commandDelegate runInBackground:^{

   

		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	}];
}

@end