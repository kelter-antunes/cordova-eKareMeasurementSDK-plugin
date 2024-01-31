//
//  eKareMeasurement.h
//  eKareMeasurementSDK
//
//  Created by Shashank Patel on 09/01/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface eKareMeasurement : NSObject

- (void)startMeasurement:(NSDictionary *)params withCompletion:(void (^)(NSDictionary *, NSError *))completionBlock;
- (NSTimeInterval)calibrationDate;
- (void)clearCalibrationValues;
- (void)showCalibrationValues;

@end

NS_ASSUME_NONNULL_END
