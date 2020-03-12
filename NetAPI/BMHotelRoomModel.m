//
//  BMHotelRoomModel.m
//  BMZhongQiBaoBuyPro
//
//  Created by zhouzk on 2019/4/18.
//  Copyright © 2019 zhouzk. All rights reserved.
//

#import "BMHotelRoomModel.h"

@implementation BMHotelRoomModel
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"hotelId":@"id",
             };
}

+ (NSDictionary*)modelContainerPropertyGenericClass{
    return @{@"roomTypeList":BMHotelRoomDailModel.class};
}

@end

@implementation BMHotelRoomDailModel

@end


@implementation BMAttractionsModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"attractionsId":@"id",
             };
}
@end

@implementation BMLineModel
@end
@implementation QusetionModel
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"questionid":@"id",
             };
}


@end
@implementation HomeInfoModel
@end

@implementation HotelModel
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"homeid":@"id",
             };
}
@end

@implementation TravelModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"levelID":@"id",
             };
}

@end

@implementation BasyTypeModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"typid":@"id",
             };
}

@end


@implementation CommentImage
@end

@implementation Comment
//+ (NSDictionary *)modelContainerPropertyGenericClass {
////    return @{@"img" :CommentImage.class,}; // 这里的 value，应该是容器内元素的类型，即字符串，你放个 NSArray 算啥意思
//}
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"commentId":@"id",
             };
}
+ (NSDictionary*)modelContainerPropertyGenericClass{
    return @{@"subsetRouteList":Comment.class,@"subsetHotelList":Comment.class,@"subsetScenicList":Comment.class};
}
 
@end

@implementation AreaSubModel
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"modelid":@"id",
             };
}
@end
@implementation AreaParentModel
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"modelid":@"id",
             };
}

@end

@implementation AreaAllModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"cityid":@"id",
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"sceneList" :AreaSubModel.class,
             }; // 这里的 value，应该是容器内元素的类型，即字符串，你放个 NSArray 算啥意思
}


@end
@implementation QuestionListModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"listid":@"id",
             };
}

@end

@implementation CommTrModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"commid":@"id",
             };
}

@end
@implementation OrderModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"orderid":@"id",
             };
}

@end
@implementation WXPayModel



@end
@implementation CollectionModel



@end
