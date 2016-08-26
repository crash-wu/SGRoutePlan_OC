//
//  CarLineEntity.m
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "CarLine.h"
#import <YYModel/YYModel.h>

@implementation CarLine
- (NSString *)description
{
    return [self yy_modelDescription];
}




+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"carRoutes" : [CarLineNode class]};
}

@end
