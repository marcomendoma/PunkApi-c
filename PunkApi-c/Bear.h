//
//  Bear.h
//  PunkApi-c
//
//  Created by Marco Antonio Mendonca on 8/17/17.
//  Copyright © 2017 Marco Antonio Mendonca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bear : NSObject
@property(nonatomic, assign) NSInteger bearId;
@property(nonatomic, strong) NSString *imagem;
@property(nonatomic, strong) NSString *nome;
@property(nonatomic, strong) NSNumber *teor;

+ (Bear *) comDicionario: (NSDictionary *) dicionario;

@end
