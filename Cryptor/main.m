//
//  main.m
//  Cryptor
//
//  Created by slyd0g on 5/25/21.
//

#import <Foundation/Foundation.h>

// from https://github.com/KyleBanks/XOREncryption/blob/master/Objective-C/main.m
@interface XOREncryption : NSObject
+(NSString *) encryptDecrypt:(NSString *)input;
@end

@implementation XOREncryption

+(NSString *) encryptDecrypt:(NSString *)input {
    unichar key[] = {'A', 'B', 'C', 'D'}; //Can be any chars, and any size array
    NSMutableString *output = [[NSMutableString alloc] init];
    
    for(int i = 0; i < input.length; i++) {
        unichar c = [input characterAtIndex:i];
        c ^= key[i % (sizeof(key)/sizeof(unichar))];
        [output appendString:[NSString stringWithFormat:@"%C", c]];
    }
    
    return output;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString* username = @"slyd0g_username";
        NSString* password = @"slyd0g_password";
        
        // Combine strings
        NSString* combined = [NSString stringWithFormat:@"%@ : %@", username, password];
        NSLog(@"Combined User/Pass: %@", combined);
        
        // Encrypt + B64 encode
        NSString* encrypted_data = [XOREncryption encryptDecrypt:combined];
        NSData* data = [encrypted_data dataUsingEncoding:NSUTF8StringEncoding];
        NSString* b64 = [data base64EncodedStringWithOptions:kNilOptions];
        NSLog(@"B64 Encrypted: %@", b64);
    }
    return 0;
}
