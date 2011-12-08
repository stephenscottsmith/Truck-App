//
//  ScheduleViewController.h
//  Truck Tracker App
//
//  Created by Scott Smith on 11/17/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Truck.h"

@interface ScheduleViewController : UIViewController {
    
    UIImage *scheduleUIImage;
    UIImageView *scheduleUIImageView;
}

@property (nonatomic, retain) UIImage  *scheduleUIImage;
@property (nonatomic, retain) IBOutlet UIImageView *scheduleUIImageView;

@end
