//
//  MFNearbyTruthHeartLoadingView.m
//  ffff
//
//  Created by syp on 15/10/15.
//  Copyright © 2015年 syp. All rights reserved.
//

#import "MFNearbyTruthHeartLoadingView.h"

@protocol MFNearbyTruthHeartLoadingAnimation <NSObject>

- (void)startAnimation;
- (void)endAnimation;

@end

@interface MFNearbyTruthHeartLoadingWaveAnimation : UIImageView <MFNearbyTruthHeartLoadingAnimation>

@end

@interface MFNearbyTruthHeartLoadingPointAnimation : UIImageView <MFNearbyTruthHeartLoadingAnimation>

@end

@interface MFNearbyTruthHeartCircumAnimation : UIImageView <MFNearbyTruthHeartLoadingAnimation>

@end


@interface MFNearbyTruthHeartLoadingView ()

@property (nonatomic, strong) UIImageView *backgroudImageView;
@property (nonatomic, strong) NSArray *animations;

@end

@implementation MFNearbyTruthHeartLoadingView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _backgroudImageView = [[UIImageView alloc] init];
    }
    return self;
}

- (void)startLoading
{
    for (id<MFNearbyTruthHeartLoadingAnimation> animation in self.animations) {
        [animation startAnimation];
    }
}

- (void)endLoading
{
    for (id<MFNearbyTruthHeartLoadingAnimation> animation in self.animations) {
        [animation endAnimation];
    }
}

@end

@implementation MFNearbyTruthHeartLoadingWaveAnimation


@end
