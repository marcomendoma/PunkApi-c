//
//  Bear.m
//  PunkApi-c
//
//  Created by Marco Antonio Mendonca on 8/17/17.
//  Copyright © 2017 Marco Antonio Mendonca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bear.h"

@implementation Bear

@synthesize bearId, imagem, nome, teor;

+ (Bear *) comDicionario: (NSDictionary *) dicionario {
    Bear * bear = [[Bear alloc] init];
    [bear setBearId: (NSInteger)[dicionario objectForKey:@"id"]];
    [bear setNome: (NSString*)[dicionario objectForKey:@"name"]];
    [bear setNome: (NSString*)[dicionario objectForKey:@"image_url"]];
    [bear setNome: [dicionario objectForKey:@"abv"]];
    
    return bear;
}

@end
