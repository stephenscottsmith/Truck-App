//
//  BlockPartyDetailViewController.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 4/17/12.
//  Copyright (c) 2012 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockParty.h"


@interface BlockPartyDetailViewController : UIViewController
{
    BlockParty *blockparty;
}

@property (nonatomic, retain)BlockParty *blockparty;

@end
