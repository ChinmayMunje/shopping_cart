//
//
// List<ProductModel> getProduct(){
//   List<ProductModel> myProduct = List<ProductModel>();
//   ProductModel productModel;
//
//   productModel = new ProductModel();
//   productModel.name = "Aloevera Soap";
//   productModel.description = "This is a soap which is very good with aloevera";
//   productModel.category = "Body Care";
//   productModel.price = "100";
//   productModel.stock = "300";
//   myProduct.add(productModel);
//
//   productModel = new ProductModel();
//   productModel.name = "Herbal Face Wash";
//   productModel.description = "This is an amazing Face wash which is very good for your skin.";
//   productModel.category = "Body Care";
//   productModel.price = "220";
//   productModel.stock = "250";
//   myProduct.add(productModel);
//
//   productModel = new ProductModel();
//   productModel.name = "Apple";
//   productModel.description = "Amazing Apples directly from farm to your home";
//   productModel.category = "Fruits and Vegetables";
//   productModel.price = "120";
//   productModel.stock = "150";
//   myProduct.add(productModel);
//
//   productModel = new ProductModel();
//   productModel.name = "Organic Cabbage";
//   productModel.description = "Organic Cabbage directly from farm to your home, without any preservatives or pesticides.";
//   productModel.category = "Fruits and Vegetables";
//   productModel.price = "40";
//   productModel.stock = "170";
//   myProduct.add(productModel);
//
//   productModel = new ProductModel();
//   productModel.name = "Oranges";
//   productModel.description = "Farm Oranges in ";
//   productModel.category = "Body Care";
//   productModel.price = "100";
//   productModel.stock = "300";
//   myProduct.add(productModel);
//
//   productModel = new ProductModel();
//   productModel.name = "Aloevera Soap";
//   productModel.description = "This is a soap which is very good with aloevera";
//   productModel.category = "Body Care";
//   productModel.price = "100";
//   productModel.stock = "300";
//   myProduct.add(productModel);
//
//
// }

class ProductModel {
  int itemDiffConfigId;
  Image image;
  Price price;
  Title title;

  ProductModel({this.itemDiffConfigId, this.image, this.price, this.title});

  ProductModel.fromJson(Map<String, dynamic> json) {
    itemDiffConfigId = json['itemDiffConfigId'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemDiffConfigId'] = this.itemDiffConfigId;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    return data;
  }
}

class Image {
  String imgUrl;

  Image({this.imgUrl});

  Image.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}

class Price {
  SellPrice sellPrice;

  Price({this.sellPrice});

  Price.fromJson(Map<String, dynamic> json) {
    sellPrice = json['sell_price'] != null
        ? new SellPrice.fromJson(json['sell_price'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sellPrice != null) {
      data['sell_price'] = this.sellPrice.toJson();
    }
    return data;
  }
}

class SellPrice {
  String formatedAmount;

  SellPrice({this.formatedAmount});

  SellPrice.fromJson(Map<String, dynamic> json) {
    formatedAmount = json['formatedAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['formatedAmount'] = this.formatedAmount;
    return data;
  }
}

class Title {
  String title;

  Title({this.title});

  Title.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}





