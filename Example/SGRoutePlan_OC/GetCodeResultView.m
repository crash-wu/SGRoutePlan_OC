//
//  GetCodeResultView.m
//  SGRoutePlan_OC
//
//  Created by 吴小星 on 16/9/1.
//  Copyright © 2016年 吴小星. All rights reserved.
//

#import "GetCodeResultView.h"

@implementation GetCodeResultView



-(void)layoutSubviews{
    [super layoutSubviews];
    self.backgroundColor = [UIColor whiteColor];
    self.nameLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/2)];
    [self addSubview:self.nameLb];
    
    self.addressLb = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2)];
    [self addSubview:self.addressLb];
}

@end
