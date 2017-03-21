//
//  HYPhotoModel.h
//  AppOfArt
//
//  Created by LeeBruce on 17/2/23.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYPhotoModel : NSObject




// id
@property (nonatomic , strong) NSString *coverPic;
@property (nonatomic , strong) NSString *picTitle;
@property (nonatomic , strong) NSString *contentText;
//@property (nonatomic , assign) NSInteger classes_time;
@property (nonatomic , strong) NSString *tags;
// WIDTH
@property (nonatomic , strong) NSString  *picW;
// height
@property (nonatomic , strong) NSString  *picH;

// WORKS ID
@property (nonatomic , strong) NSString *WorksId;
// SharingUrl
@property (nonatomic , strong) NSString *SharingUrl;

- (instancetype)initWithDict:(NSDictionary *)dic;
@end
