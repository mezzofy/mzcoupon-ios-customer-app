//
//  DeliveryCell.h
//  EB
//
//  Created by Kaliyarajalu on 25/12/14.
//  Copyright (c) 2014 Thoughts Igniter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface DeliveryCell : UITableViewCell

//Select One
@property (nonatomic, retain) IBOutlet UILabel *lblSelect;

//Site
@property (nonatomic, retain) IBOutlet UILabel *lblSiteName;
@property (nonatomic, retain) IBOutlet UILabel *lblSiteAddress;
@property (nonatomic, retain) IBOutlet UILabel *lblContact;
@property (nonatomic, retain) IBOutlet UIImageView *imgSite;

//Company
@property (nonatomic, retain) IBOutlet UILabel *lblCompany;

//Delivery Time
@property (nonatomic, retain) IBOutlet UILabel *lblTime;

//Contact
@property (nonatomic, retain) IBOutlet UITextField *txtName;
@property (nonatomic, retain) IBOutlet UITextField *txtContact;
@property (nonatomic, retain) IBOutlet UITextView *txtRemarks;
@property (nonatomic, retain) IBOutlet UITextView *txtaddres;
@property (nonatomic, retain) IBOutlet UITextView *textsetaddress;

@property (nonatomic, retain) IBOutlet UIButton *btnOrder;
@property (nonatomic, retain) IBOutlet UIButton *btnConfirm;
@property (nonatomic, retain) IBOutlet UIButton *btnAdress;

//Order Details
@property (nonatomic, retain) IBOutlet UILabel *lblRemarks;
@property (strong, nonatomic) IBOutlet MKMapView *mapview;

@property (nonatomic, retain) IBOutlet UIImageView *merctlogo;
@property (nonatomic, retain) IBOutlet UILabel *lblmertDesc;
@end
