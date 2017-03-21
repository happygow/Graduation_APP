//
//  HYTwoModel.h
//  AppOfArt
//
//  Created by LeeBruce on 17/2/28.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYTwoModel : NSObject

@property (nonatomic, strong) NSString *coverImageUrl;

@property (nonatomic, strong) NSString *mainTitle;

@property (nonatomic, strong) NSString *sub_title;

// url
@property (nonatomic , strong) NSString *web_url;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
