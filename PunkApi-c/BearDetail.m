//
//  BearDetail.m
//  PunkApi-c
//
//  Created by Marco Antonio Mendonca on 8/18/17.
//  Copyright © 2017 Marco Antonio Mendonca. All rights reserved.
//

#import "BearDetail.h"

@implementation BearDetail
@synthesize bearId, imagem, nome, tagline, ibu, description, teor;

+ (BearDetail *) comDicionario: (NSDictionary *) dicionario {
    BearDetail * bearDetail = [[BearDetail alloc] init];
    [bearDetail setBearId: (NSInteger)[dicionario objectForKey:@"id"]];
    [bearDetail setImagem: (NSString*)[dicionario objectForKey:@"image_url"]];
    [bearDetail setNome: (NSString*)[dicionario objectForKey:@"name"]];
    [bearDetail setTagline: (NSString*)[dicionario objectForKey:@"tagline"]];
    [bearDetail setIbu: (NSNumber*)[dicionario objectForKey:@"ibu"]];
    [bearDetail setDescrition: (NSString*)[dicionario objectForKey:@"description"]];
    [bearDetail setTeor: (NSNumber*) [dicionario objectForKey:@"abv"]];
    
    return bearDetail;
}

@end
