//
//  BearViewController.h
//  PunkApi-c
//
//  Created by Marco Antonio Mendonca on 8/18/17.
//  Copyright © 2017 Marco Antonio Mendonca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BearDetailsViewController : UIViewController {
    int idSelecionado;
}

@property int idSelecionado;
@property (strong, nonatomic) IBOutlet UIImageView *imageBear;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *tagline;
@property (strong, nonatomic) IBOutlet UILabel *abv;
@property (strong, nonatomic) IBOutlet UILabel *ibu;
@property (strong, nonatomic) IBOutlet UITextView *descricao;

@end
