//
//  ViewController.m
//  ObjcEncrypt
//
//  Created by Pablo Ramirez Barrientos on 30/08/18.
//  Copyright © 2018 Pablo Ramirez Barrientos. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import "EncryptorAES.h"
#import "NSData+AESCrypt.h"
#import "NSString+AESCrypt.h"
#import "NSData+Base64.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /////////////////////// Primer método
    
    NSString * string = @"555556";
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    const uint8_t key[] = { 'T', 'e', 'l', 'M', 'E', 'X', 't', 'E', 's', 't', 'v','a', 'L', 'k', 'e', 'Y' };
    NSMutableString *result  = [NSMutableString string];
    for (int i = 0; i < 16; ++i) {
        [result appendFormat:@"%02x", (uint8_t)key[i]];
    }
    
    NSString *value = [EncryptorAES encryptToBase64:data Key:result IV:@""]; //@"T3lm3x_3mpl3ad05" en lugar de la variable result
    
    NSLog(@"value = %@", value);
    
    /////////////////////// Segundo método
    
    NSString *key2 = @"TelMEXtEstvaLkeY";//@"TelMEXtEstvaLkeY";
    
    NSData *cipherData;
    NSString *base64Text, *plainText;
    
    //############## Request(crypt) ##############
    plainText  = @"555556";
    cipherData = [[plainText dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptWithKey:key2];
    base64Text = [cipherData base64Encoding];
    
    NSLog(@"%@", base64Text);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
