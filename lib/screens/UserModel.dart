import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel ({
    this.itemDiffConfigId,
    this.productElements,
    this.productId,
    this.productType,
    this.status,
    this.type,
    this.p4P,
  });

  int itemDiffConfigId;
  ProductElements productElements;
  int productId;
  ProductType productType;
  int status;
  Type type;
  P4P p4P;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    itemDiffConfigId: json["itemDiffConfigId"],
    productElements: ProductElements.fromJson(json["productElements"]),
    productId: json["productId"],
    productType: productTypeValues.map[json["productType"]],
    status: json["status"],
    type: typeValues.map[json["type"]],
    p4P: json["p4p"] == null ? null : P4P.fromJson(json["p4p"]),
  );

  Map<String, dynamic> toJson() => {
    "itemDiffConfigId": itemDiffConfigId,
    "productElements": productElements.toJson(),
    "productId": productId,
    "productType": productTypeValues.reverse[productType],
    "status": status,
    "type": typeValues.reverse[type],
    "p4p": p4P == null ? null : p4P.toJson(),
  };
}

class P4P {
  P4P({
    this.adTag,
    this.clickUrl,
    this.sessionId,
  });

  AdTag adTag;
  String clickUrl;
  String sessionId;

  factory P4P.fromJson(Map<String, dynamic> json) => P4P(
    adTag: AdTag.fromJson(json["adTag"]),
    clickUrl: json["clickUrl"],
    sessionId: json["sessionId"],
  );

  Map<String, dynamic> toJson() => {
    "adTag": adTag.toJson(),
    "clickUrl": clickUrl,
    "sessionId": sessionId,
  };
}

class AdTag {
  AdTag({
    this.type,
    this.displayTagType,
    this.tagText,
  });

  String type;
  String displayTagType;
  String tagText;

  factory AdTag.fromJson(Map<String, dynamic> json) => AdTag(
    type: json["@type"],
    displayTagType: json["displayTagType"],
    tagText: json["tagText"],
  );

  Map<String, dynamic> toJson() => {
    "@type": type,
    "displayTagType": displayTagType,
    "tagText": tagText,
  };
}

class ProductElements {
  ProductElements({
    this.evaluation,
    this.image,
    this.trade,
    this.viewMore,
    this.price,
    this.logistics,
    this.sellingPoint,
    this.title,
  });

  Evaluation evaluation;
  Image image;
  Trade trade;
  ViewMore viewMore;
  Price price;
  Logistics logistics;
  List<SellingPoint> sellingPoint;
  Title title;

  factory ProductElements.fromJson(Map<String, dynamic> json) => ProductElements(
    evaluation: json["evaluation"] == null ? null : Evaluation.fromJson(json["evaluation"]),
    image: Image.fromJson(json["image"]),
    trade: Trade.fromJson(json["trade"]),
    viewMore: ViewMore.fromJson(json["view_more"]),
    price: Price.fromJson(json["price"]),
    logistics: Logistics.fromJson(json["logistics"]),
    sellingPoint: json["selling_point"] == null ? null : List<SellingPoint>.from(json["selling_point"].map((x) => SellingPoint.fromJson(x))),
    title: Title.fromJson(json["title"]),
  );

  Map<String, dynamic> toJson() => {
    "evaluation": evaluation == null ? null : evaluation.toJson(),
    "image": image.toJson(),
    "trade": trade.toJson(),
    "view_more": viewMore.toJson(),
    "price": price.toJson(),
    "logistics": logistics.toJson(),
    "selling_point": sellingPoint == null ? null : List<dynamic>.from(sellingPoint.map((x) => x.toJson())),
    "title": title.toJson(),
  };
}

class Evaluation {
  Evaluation({
    this.starHeight,
    this.starRating,
    this.starUrl,
    this.starWidth,
  });

  int starHeight;
  String starRating;
  String starUrl;
  int starWidth;

  factory Evaluation.fromJson(Map<String, dynamic> json) => Evaluation(
    starHeight: json["starHeight"],
    starRating: json["starRating"],
    starUrl: json["starUrl"],
    starWidth: json["starWidth"],
  );

  Map<String, dynamic> toJson() => {
    "starHeight": starHeight,
    "starRating": starRating,
    "starUrl": starUrl,
    "starWidth": starWidth,
  };
}

class Image {
  Image({
    this.elementId,
    this.elementType,
    this.imgHeight,
    this.imgUrl,
    this.imgWidth,
  });

  int elementId;
  ImageElementType elementType;
  int imgHeight;
  String imgUrl;
  int imgWidth;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    elementId: json["elementId"],
    elementType: imageElementTypeValues.map[json["elementType"]],
    imgHeight: json["imgHeight"],
    imgUrl: json["imgUrl"],
    imgWidth: json["imgWidth"],
  );

  Map<String, dynamic> toJson() => {
    "elementId": elementId,
    "elementType": imageElementTypeValues.reverse[elementType],
    "imgHeight": imgHeight,
    "imgUrl": imgUrl,
    "imgWidth": imgWidth,
  };
}

enum ImageElementType { IMAGE }

final imageElementTypeValues = EnumValues({
  "image": ImageElementType.IMAGE
});

class Logistics {
  Logistics({
    this.elementId,
    this.elementType,
    this.logisticsDesc,
  });

  int elementId;
  LogisticsElementType elementType;
  String logisticsDesc;

  factory Logistics.fromJson(Map<String, dynamic> json) => Logistics(
    elementId: json["elementId"],
    elementType: logisticsElementTypeValues.map[json["elementType"]],
    logisticsDesc: json["logisticsDesc"] == null ? null : json["logisticsDesc"],
  );

  Map<String, dynamic> toJson() => {
    "elementId": elementId,
    "elementType": logisticsElementTypeValues.reverse[elementType],
    "logisticsDesc": logisticsDesc == null ? null : logisticsDesc,
  };
}

enum LogisticsElementType { LOGISTICS }

final logisticsElementTypeValues = EnumValues({
  "logistics": LogisticsElementType.LOGISTICS
});

class Price {
  Price({
    this.sellPrice,
  });

  SellPrice sellPrice;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    sellPrice: SellPrice.fromJson(json["sell_price"]),
  );

  Map<String, dynamic> toJson() => {
    "sell_price": sellPrice.toJson(),
  };
}

class SellPrice {
  SellPrice({
    this.currency,
    this.formatedAmount,
    this.priceType,
    this.value,
  });

  Currency currency;
  String formatedAmount;
  PriceType priceType;
  double value;

  factory SellPrice.fromJson(Map<String, dynamic> json) => SellPrice(
    currency: currencyValues.map[json["currency"]],
    formatedAmount: json["formatedAmount"],
    priceType: priceTypeValues.map[json["priceType"]],
    value: json["value"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "currency": currencyValues.reverse[currency],
    "formatedAmount": formatedAmount,
    "priceType": priceTypeValues.reverse[priceType],
    "value": value,
  };
}

enum Currency { USD }

final currencyValues = EnumValues({
  "USD": Currency.USD
});

enum PriceType { PC_PROMOTION_PRICE }

final priceTypeValues = EnumValues({
  "pc_promotion_price": PriceType.PC_PROMOTION_PRICE
});

class SellingPoint {
  SellingPoint({
    this.displayStyle,
    this.order,
    this.sellingPointTag,
    this.sellingPointTagId,
    this.sellingPointType,
  });

  String displayStyle;
  int order;
  SellingPointTag sellingPointTag;
  String sellingPointTagId;
  String sellingPointType;

  factory SellingPoint.fromJson(Map<String, dynamic> json) => SellingPoint(
    displayStyle: json["displayStyle"],
    order: json["order"],
    sellingPointTag: SellingPointTag.fromJson(json["sellingPointTag"]),
    sellingPointTagId: json["sellingPointTagId"],
    sellingPointType: json["sellingPointType"],
  );

  Map<String, dynamic> toJson() => {
    "displayStyle": displayStyle,
    "order": order,
    "sellingPointTag": sellingPointTag.toJson(),
    "sellingPointTagId": sellingPointTagId,
    "sellingPointType": sellingPointType,
  };
}

class SellingPointTag {
  SellingPointTag({
    this.type,
    this.displayTagType,
    this.tagImgHeight,
    this.tagImgUrl,
    this.tagImgWidth,
    this.tagText,
  });

  String type;
  String displayTagType;
  int tagImgHeight;
  String tagImgUrl;
  int tagImgWidth;
  String tagText;

  factory SellingPointTag.fromJson(Map<String, dynamic> json) => SellingPointTag(
    type: json["@type"],
    displayTagType: json["displayTagType"],
    tagImgHeight: json["tagImgHeight"] == null ? null : json["tagImgHeight"],
    tagImgUrl: json["tagImgUrl"] == null ? null : json["tagImgUrl"],
    tagImgWidth: json["tagImgWidth"] == null ? null : json["tagImgWidth"],
    tagText: json["tagText"] == null ? null : json["tagText"],
  );

  Map<String, dynamic> toJson() => {
    "@type": type,
    "displayTagType": displayTagType,
    "tagImgHeight": tagImgHeight == null ? null : tagImgHeight,
    "tagImgUrl": tagImgUrl == null ? null : tagImgUrl,
    "tagImgWidth": tagImgWidth == null ? null : tagImgWidth,
    "tagText": tagText == null ? null : tagText,
  };
}

class Title {
  Title({
    this.elementId,
    this.elementType,
    this.title,
  });

  int elementId;
  TitleElementType elementType;
  String title;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    elementId: json["elementId"],
    elementType: titleElementTypeValues.map[json["elementType"]],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "elementId": elementId,
    "elementType": titleElementTypeValues.reverse[elementType],
    "title": title,
  };
}

enum TitleElementType { TITLE }

final titleElementTypeValues = EnumValues({
  "title": TitleElementType.TITLE
});

class Trade {
  Trade({
    this.elementId,
    this.elementType,
    this.tradeDesc,
  });

  int elementId;
  TradeElementType elementType;
  String tradeDesc;

  factory Trade.fromJson(Map<String, dynamic> json) => Trade(
    elementId: json["elementId"],
    elementType: tradeElementTypeValues.map[json["elementType"]],
    tradeDesc: json["tradeDesc"],
  );

  Map<String, dynamic> toJson() => {
    "elementId": elementId,
    "elementType": tradeElementTypeValues.reverse[elementType],
    "tradeDesc": tradeDesc,
  };
}

enum TradeElementType { TRADE }

final tradeElementTypeValues = EnumValues({
  "trade": TradeElementType.TRADE
});

class ViewMore {
  ViewMore({
    this.elementId,
    this.elementType,
  });

  int elementId;
  ViewMoreElementType elementType;

  factory ViewMore.fromJson(Map<String, dynamic> json) => ViewMore(
    elementId: json["elementId"],
    elementType: viewMoreElementTypeValues.map[json["elementType"]],
  );

  Map<String, dynamic> toJson() => {
    "elementId": elementId,
    "elementType": viewMoreElementTypeValues.reverse[elementType],
  };
}

enum ViewMoreElementType { VIEW_MORE }

final viewMoreElementTypeValues = EnumValues({
  "view_more": ViewMoreElementType.VIEW_MORE
});

enum ProductType { NATURAL, AD }

final productTypeValues = EnumValues({
  "ad": ProductType.AD,
  "natural": ProductType.NATURAL
});

enum Type { SEARCH_PRODUCT_V2 }

final typeValues = EnumValues({
  "searchProductV2": Type.SEARCH_PRODUCT_V2
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
