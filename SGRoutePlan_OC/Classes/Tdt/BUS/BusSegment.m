//
//  BusSegment.m
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "BusSegment.h"

@implementation BusSegment

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"segmentLine" : [BusSegmentLine class],@"stationStart":[BusStation class],@"stationEnd" : [BusStation class]
              };
}

@end
