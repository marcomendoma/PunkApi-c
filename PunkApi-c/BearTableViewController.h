//
//  BearTableViewController.h
//  PunkApi-c
//
//  Created by Marco Antonio Mendonca on 8/17/17.
//  Copyright © 2017 Marco Antonio Mendonca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BearTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *aBears;
    NSDictionary *dict;
    
    NSString *bearId;
    NSString *name;
    NSString *abv;
    NSString *thumbnail;
    
}

@property int bearIdSelected;

@end
