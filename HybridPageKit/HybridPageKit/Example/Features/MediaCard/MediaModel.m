//
//  MediaModel.m
//  HybridPageKit
//
//  Created by dequanzhu.
//  Copyright © 2018 HybridPageKit. All rights reserved.
//

#import "MediaModel.h"
#import "MediaView.h"

@interface MediaModel()
@property(nonatomic,copy,readwrite)NSString *index;
@property(nonatomic,copy,readwrite)NSString *mediaId;
@property(nonatomic,copy,readwrite)NSString *mediaIcon;
@property(nonatomic,copy,readwrite)NSString *mediaName;
@property(nonatomic,copy,readwrite)NSString *mediaDes;
@property(nonatomic,assign,readwrite)CGRect frame;
@end
@implementation MediaModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _index = [dic objectForKey:@"index"];
        _mediaId = [dic objectForKey:@"mediaId"];
        _mediaIcon = [dic objectForKey:@"mediaIcon"];
        _mediaName = [dic objectForKey:@"mediaName"];
        _mediaDes = [dic objectForKey:@"mediaDescribe"];

        _frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100.f);
    }
    return self;
}

#pragma mark - RNSModelProtocol

-(NSString *)getUniqueId{
    return _index;
}
-(CGRect)getComponentFrame{
    return _frame;
}
-(void)setComponentFrame:(CGRect)frame{
    _frame = frame;
}
-(Class)getComponentViewClass{
    return [MediaView class];
}
-(Class)getComponentControllerClass{
    return [MediaController class];
}
-(__kindof RNSComponentContext *)getCustomContext{
    return nil;
}
-(void)setComponentOriginY:(CGFloat)originY{
    _frame = CGRectMake(_frame.origin.x, originY, _frame.size.width, _frame.size.height);
}
-(void)setComponentOriginX:(CGFloat)originX{
    _frame = CGRectMake(originX, _frame.origin.y, _frame.size.width, _frame.size.height);
}
@end