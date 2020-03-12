//
//  BMHotelRoomModel.h
//  BMZhongQiBaoBuyPro
//
//  Created by zhouzk on 2019/4/18.
//  Copyright © 2019 zhouzk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 酒店房型
@interface BMHotelRoomDailModel : NSObject
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *bedname;
@property (nonatomic, strong) NSString *bedType;
@property (nonatomic, strong) NSString *casement;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *discountPrice;
@property (nonatomic, strong) NSString *floor;
@property (nonatomic, strong) NSString *hotelId;
@property (nonatomic, strong) NSString *roomid;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *typeId;
@property (nonatomic, strong) NSString *updatedAt;

@end
// 酒店
@interface BMHotelRoomModel : NSObject
/**
 * 返回数据添加字段（非表字段）
 */
/**
 * id （IOS  id 是关键字 前端调用不能识别 因此设置别称传输
 */
@property (nonatomic, strong) NSString *hotelId;
@property (nonatomic, strong) NSString *name; 
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *ctiyId;
@property (nonatomic, strong) NSString *homePage;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSArray *imgList;
@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, strong) NSString *labelName;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSArray *provinceId;
@property (nonatomic, strong) NSString *regionPage;
@property (nonatomic, strong) NSArray <BMHotelRoomDailModel*>*roomTypeList;
@property (nonatomic, strong) NSString *sceneId;
@property (nonatomic, strong) NSString *typeId;
@property (nonatomic, strong) NSArray *typeName;
@property (nonatomic, strong) NSString *updatedAt;

@end


// 景点
@interface BMAttractionsModel : NSObject
/**
 * 返回数据添加字段（非表字段）
 */
/**
 * id （IOS  id 是关键字 前端调用不能识别 因此设置别称传输
 */
@property (nonatomic, strong) NSString *attractionsId;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *adultPrice;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *collectType;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *details;
@property (nonatomic, strong) NSString *discountPrice;
@property (nonatomic, strong) NSString *homeSort;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *notice;
@property (nonatomic, strong) NSString *province;
@property (nonatomic, strong) NSString *sceneId;
@property (nonatomic, strong) NSString *score;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *stuPrice;
@property (nonatomic, strong) NSString *updatedAt;

@end

// 路线
@interface BMLineModel : NSObject
@property (nonatomic, strong) NSString *lineId;//区',
@property (nonatomic, strong) NSString *lineName;//线路名称',
@property (nonatomic, strong) NSString *lineType;//线路类型（1 普通线路 2 轮播推广线路）',
@property (nonatomic, strong) NSString *lineProvince;//省',
@property (nonatomic, strong) NSString *lineCity;//市',
@property (nonatomic, strong) NSString *lineArea;//区',
@property (nonatomic, strong) NSString *lineAddress;//详细地址',
@property (nonatomic, strong) NSString *lineTrip;//线路行程',
@property (nonatomic, strong) NSString *lineRemark;//线路说明',
@property (nonatomic, strong) NSString *lineImage;//线路图片',
@property (nonatomic, strong) NSString *lineOriginalPrice;//线路价格（原价）',
@property (nonatomic, strong) NSString *lineStatus;//线路状态（1启用 2停用）',
@property (nonatomic, strong) NSString *lineTouristNum;// 所有随机数值到后台处理

@end

@interface CommentImage: NSObject
@property (nonatomic, strong) NSString *url;
//@property (nonatomic, strong) NSString *comId;
//@property (nonatomic, strong) NSString *comImage;
@end

@interface Comment: NSObject
@property (nonatomic, strong) NSString *commentId;//
@property (nonatomic, strong) NSString *strategyId;
@property (nonatomic, strong) NSString *scenicId;
@property (nonatomic, strong) NSString *cusId; //
@property (nonatomic, strong) NSString *praise; //
@property (nonatomic, strong) NSString *isPraise; //
@property (nonatomic, strong) NSString *checked; //
@property (nonatomic, strong) NSString *details; //
@property (nonatomic, strong) NSString *quality; //
@property (nonatomic, strong) NSString *createdAt; //
@property (nonatomic, strong) NSString *updateAt;//
@property (nonatomic, strong) NSString *reply; //
@property (nonatomic, strong) NSString *replyTime ; 
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *portrait;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *routeId;
@property (nonatomic, strong) NSString *subsetRouteCount;
//@property (nonatomic, strong) NSArray<CommentImage *> *img;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSMutableArray<Comment *> *subsetRouteList;
@property (nonatomic, strong) NSMutableArray<Comment *> *subsetHotelList;
@property (nonatomic, strong) NSMutableArray<Comment *> *subsetScenicList;
@property (nonatomic, strong) NSString *replyContent;
@property (nonatomic, strong) NSString *replyNickName;

@end


@interface QuestionListModel : NSObject
@property (nonatomic, strong) NSString *alevel; 
@property (nonatomic, strong) NSString *collectType;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *cus_id;
@property (nonatomic, strong) NSString *listid;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *nick_name;
@property (nonatomic, strong) NSString *portrait;
@property (nonatomic, strong) NSString *praiseType;
@property (nonatomic, strong) NSString *question_id;
@property (nonatomic, strong) NSString *reply_time;
@property (nonatomic, strong) NSString *status;
@end




@interface AreaSubModel: NSObject
@property (nonatomic, strong) NSString *modelid;
@property (nonatomic, strong) NSString *dictTypeId;//": 4,
@property (nonatomic, strong) NSString *code;//": "GS_001",
@property (nonatomic, strong) NSString *name;//": "甘肃",
@property (nonatomic, strong) NSString *parentId;//": 6,
@property (nonatomic, strong) NSString *weight;//": "2",
@property (nonatomic, strong) NSString *note;//": "https://...",
@property (nonatomic, strong) NSString *creatorId;//": "",
@property (nonatomic, strong) NSString *createTime;//": "",
@property (nonatomic, strong) NSString *lastModifierId;//": "",
@property (nonatomic, strong) NSString *lastModifyTime;//": "",
@property (nonatomic, strong) NSString *creatorName;//": "",
@property (nonatomic, strong) NSString *lastModifierName;//": "",
@property (nonatomic, strong) NSString *dictTypeName;//": "",
@property (nonatomic, strong) NSString *parentName;//": ""
@property (nonatomic, assign) BOOL isSel;
@end

@interface AreaParentModel: NSObject
@property (nonatomic, strong) NSString *modelid;
@property (nonatomic, strong) NSString *dictTypeId;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *parentId;
@property (nonatomic, strong) NSString *weight;
@property (nonatomic, strong) NSString *note;
@property (nonatomic, strong) NSString *creatorId;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *creatorName;
@property (nonatomic, strong) NSString *dictTypeName;
@end

@interface AreaAllModel: NSObject
//@property (nonatomic, strong) AreaParentModel *primaryScene;
@property (nonatomic, strong) NSString *cityid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray<AreaSubModel*> *sceneList;
@end


 


@interface HomeInfoModel : NSObject

@property (nonatomic, strong) NSArray *journeyList;
@property (nonatomic, strong) NSString *sceneId;
@property (nonatomic, strong) NSString *routeId;
@property (nonatomic, strong) NSString *routeName;
@property (nonatomic, strong) NSString *routePrice;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSArray *imgList;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *sceneName;
@property (nonatomic, strong) NSString *scenePid;
@property (nonatomic, strong) NSString *sceneCreatedAt;
@property (nonatomic, strong) NSString *sceneUpdatedAt;
@property (nonatomic, strong) NSString *routeTypeId;
@property (nonatomic, strong) NSString *routeTypeName;
@property (nonatomic, strong) NSString *routeTypeCreatedAt;
@property (nonatomic, strong) NSString *routeTypeUpdatedAt;
@property (nonatomic, strong) NSString *routeDetails;
@property (nonatomic, strong) NSString *routeCreatedAt;
@property (nonatomic, strong) NSString *routeUpdatedAt;
@property (nonatomic, strong) NSString *days;
@property (nonatomic, strong) NSString *amountCust;
@property (nonatomic, strong) NSString *amountBrowse;
@property (nonatomic, strong) NSString *commentNo;
@property (nonatomic, strong) NSString *collectionNo;
@property (nonatomic, strong) NSString *labelList;
@property (nonatomic, strong) NSString *journey;
@property (nonatomic, strong) NSString *collectType;
@property (nonatomic, strong) NSString *deposit;
@property (nonatomic, strong) NSString *tailMoney;
@property (nonatomic, strong) NSString *status;
@end
@interface TravelModel : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *subHead;
@property (nonatomic, strong) NSString *levelID;
@property (nonatomic, strong) NSString *sceneId;
@property (nonatomic, strong) NSString *authorLevel;

@property (nonatomic, strong) NSString *readers;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *createAt;

@property (nonatomic, strong) NSString *updateAt;
@property (nonatomic, strong) NSString *commentNum;
@property (nonatomic, strong) NSString *collectionNum;

@property (nonatomic, strong) NSString *peopleNumber;
@property (nonatomic, strong) NSString *dayNumber;
@property (nonatomic, strong) NSString *vagConsum;

@property (nonatomic, strong) NSString *headPortrait;
@property (nonatomic, strong) NSString *routeType;
@property (nonatomic, strong) NSString *publicDay;

@property (nonatomic, strong) NSString *collectType;


@end

@interface BasyTypeModel : NSObject
@property (nonatomic, strong) NSString *typid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *busType;

@end

@interface HotelModel : NSObject
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *areaId;
@property (nonatomic, strong) NSString *collectType;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *ctiyId;
@property (nonatomic, strong) NSString *homePage;
@property (nonatomic, strong) NSString *homeid;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSArray *imgList;
@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, strong) NSString *labelName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *provinceId;
@property (nonatomic, strong) NSString *regionPage;
@property (nonatomic, strong) NSString *roomTypeList;
@property (nonatomic, strong) NSString *sceneId;
@property (nonatomic, strong) NSString *typeId;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic, strong) NSString *updatedAt;
@end



@interface QusetionModel : NSObject
@property (nonatomic, strong) NSString *answer_num;
@property (nonatomic, strong) NSString *bus_type;
@property (nonatomic, strong) NSString *collectType;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *questionid;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *label_id;
@property (nonatomic, strong) NSArray *name;
@property (nonatomic, strong) NSString *nick_name;
@property (nonatomic, strong) NSString *page_view;
@property (nonatomic, strong) NSString *portrait;
@property (nonatomic, strong) NSString *praise;
@property (nonatomic, strong) NSString *qlevel;
@property (nonatomic, strong) NSString *question_num;
@property (nonatomic, strong) NSString *scene_id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *updated_at;

@end


@interface OrderModel : NSObject
@property (nonatomic, strong) NSString *adultNo;
@property (nonatomic, strong) NSString *childrenNo;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *departureDate;
@property (nonatomic, strong) NSString *deposit;
@property (nonatomic, strong) NSString *depositType;
@property (nonatomic, strong) NSArray *discountDescription;
@property (nonatomic, strong) NSArray *bisOrderPays;
@property (nonatomic, strong) NSString *orderid;
@property (nonatomic, strong) NSString *linkmanPhone;
@property (nonatomic, strong) NSString *linkmanName;
@property (nonatomic, strong) NSString *orderNumber;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *realbackPrice;
@property (nonatomic, strong) NSString *refundDate;
@property (nonatomic, strong) NSString *refundReasons;
@property (nonatomic, strong) NSString *refundDiscount;

@property (nonatomic, strong) NSString *rellayPrice;
@property (nonatomic, strong) NSString *routeId;
@property (nonatomic, strong) NSString *lineAppImg;
@property (nonatomic, strong) NSString *routeName;
@property (nonatomic, strong) NSString *routeTypeName;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *tailMoney;
@property (nonatomic, strong) NSString *adultPrice;
@property (nonatomic, strong) NSString *childrenPrice;
@property (nonatomic, strong) NSString *discountPrice;
@property (nonatomic, strong) NSString *journey;
@property (nonatomic, strong) NSString *overtime;
@property (nonatomic, strong) NSString *payDate;
@property (nonatomic, strong) NSString *payType;
@property (nonatomic, strong) NSString *tailApplyDate;
@property (nonatomic, strong) NSString *tailCenterDate;
@property (nonatomic, strong) NSString *tailPayDate;
@property (nonatomic, strong) NSString *tailPayNumber;
@property (nonatomic, strong) NSString *tailPayType;
@property (nonatomic, strong) NSString *tailRejectDate;
@property (nonatomic, strong) NSString *tailSuccessDate;
@property (nonatomic, strong) NSString *tradingNumber;
@property (nonatomic, strong) NSArray *travellerList;
@property (nonatomic, strong) NSString *invoiced;
@property (nonatomic, strong) NSString *discountId;
@property (nonatomic, strong) NSString *portionRefundState;
@property (nonatomic, strong) NSString *portionRefundMoney;
@property (nonatomic, strong) NSString *addingMoney;
@end



@interface CommTrModel : NSObject
@property (nonatomic, strong) NSString *oneself;
@property (nonatomic, strong) NSString *commid;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *card;
@property (nonatomic, strong) NSString *cusId;
@property (nonatomic, strong) NSString *cardType;
@property (nonatomic, strong) NSString *ticketType;
@end

@interface WXPayModel : NSObject
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic, strong) NSString *partnerid;
@property (nonatomic, strong) NSString *package;
@property (nonatomic, strong) NSString *noncestr;
@property (nonatomic, strong) NSString *sign;
@property (nonatomic, strong) NSString *appid;
@property (nonatomic, strong) NSString *prepayid;
@end

@interface CollectionModel : NSObject
@property (nonatomic, strong) NSString *amountCust;
@property (nonatomic, strong) NSString *days;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *labelList;
@property (nonatomic, strong) NSString *routeId;
@property (nonatomic, strong) NSString *routeName;
@property (nonatomic, strong) NSString *routePrice;
@property (nonatomic, strong) NSString *routeTypeName;

@end
NS_ASSUME_NONNULL_END
