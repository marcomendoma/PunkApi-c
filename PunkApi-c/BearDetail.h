//
//  BearDetail.h
//  PunkApi-c
//
//  Created by Marco Antonio Mendonca on 8/18/17.
//  Copyright © 2017 Marco Antonio Mendonca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BearDetail : NSObject
@property(nonatomic, assign) NSInteger bearId;
@property(nonatomic, strong) NSString *imagem;
@property(nonatomic, strong) NSString *nome;
@property(nonatomic, strong) NSString *tagline;
@property(nonatomic, strong) NSNumber *ibu;
@property(nonatomic, strong) NSString *descrition;
@property(nonatomic, strong) NSNumber *teor;

+ (BearDetail *) comDicionario: (NSDictionary *) dicionario;

@end
