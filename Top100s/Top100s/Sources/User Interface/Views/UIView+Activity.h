//
//  UIView+Activity.h
//  Top100s
//
//  Created by Vlad-R on 10/31/14.
//  Copyright (c) 2014 Vlad-R. All rights reserved.
//

@import UIKit;

@class VRActivityView;


@interface UIView (Activity)

@property (nonatomic, strong) VRActivityView *activityView;
@property (nonatomic, assign) BOOL activityViewVisible;

@end


@interface VRActivityView : UIView

@end
