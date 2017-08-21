//
//  BearViewController.m
//  PunkApi-c
//
//  Created by Marco Antonio Mendonca on 8/18/17.
//  Copyright © 2017 Marco Antonio Mendonca. All rights reserved.
//

#import "BearDetailsViewController.h"
#import "BearDetail.h"

@interface BearDetailsViewController ()

@end

@implementation BearDetailsViewController
@synthesize idSelecionado;
@synthesize imageBear, name, tagline, abv, ibu, descricao;

- (void) BearDetailsJson {
    
    NSString *url = [NSString stringWithFormat:@"https://api.punkapi.com/v2/beers/1"];
    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
    
    NSError *error;
    NSDictionary *resultados = [NSJSONSerialization JSONObjectWithData:jsonData
                                                               options:NSJSONReadingMutableContainers error:&error];
    if(!error){
        BearDetail *bearDetail = [BearDetail comDicionario: resultados];
        NSLog(@"BeartDetail: %@", bearDetail.descrition);

        NSURL *url = [NSURL URLWithString: bearDetail.imagem];
        NSData *data = [NSData dataWithContentsOfURL: url];
        UIImage *img = [[UIImage alloc] initWithData: data];
        [imageBear setImage: img];
        
        [name setText: bearDetail.nome];
        [tagline setText: bearDetail.tagline];
        [abv setText: (NSString *) bearDetail.teor];
        [ibu setText: (NSString *) bearDetail.ibu];
        [descricao setText: bearDetail.descrition];
    
    }
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self BearDetailsJson];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
