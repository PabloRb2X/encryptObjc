//
//  EncryptorAES.h
//  LibTelmexEncrypt
//
//  Created by Pablo Ramirez Barrientos on 03/09/18.
//  Copyright © 2018 Pablo Ramirez Barrientos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncryptorAES : NSObject

+ (NSData *)encrypt:(NSData *)data Key:(id)key IV:(id)iv;
+ (NSData *)decrypt:(NSData *)data Key:(id)key IV:(id)iv;

+ (NSString *)encryptToBase64:(NSData *)data Key:(id)key IV:(id)iv;
+ (NSData *)decryptFromBase64:(NSString *)data Key:(id)key IV:(id)iv;

+ (NSData *)getKey:(NSString *)key;
+ (NSData *)getIV:(NSString *)iv;

+ (NSString*)convertHexStringFromData:(NSData*)data;

@end
