//
//  transJSON.m
//  ocrCV
//
//  Created by Fan on 2017/3/15.
//  Copyright © 2017年 Fan. All rights reserved.
//

#import "transJSON.h"

@implementation transJSON


//解析JSON数据方法，并且取某key对应的值
-(NSString *) parseJsonDataWithKey:(NSData *)data
{
    NSString *result = nil;
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (json == nil)
    {
        NSLog(@"json parse failed \r\n");
        return nil;
    }
    NSInteger *errcode = [[json objectForKey: @"errorCode"] intValue];
    NSLog(@"JSON ErrorCode: %d\r\n", errcode);
    if(errcode != 0)
    {
        return nil;
    }
    
    NSArray *array = [json objectForKey:@"translation"];
    result = [array objectAtIndex:0];
    NSLog(@"JSON translation: %@\r\n",result);
    
    return result;
}

@end
