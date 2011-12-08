//
//  MenuViewController.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 11/1/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Truck.h"

@interface MenuViewController : UIViewController {
    
    UIImage *menuUIImage;
    UIImageView *menuUIImageView;
}

@property (nonatomic, retain) UIImage  *menuUIImage;
@property (nonatomic, retain) IBOutlet UIImageView *menuUIImageView;

@end
