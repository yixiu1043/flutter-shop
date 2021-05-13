class CategoryGoodsList {
  String code;
  String message;
  List<GoodsItem> data;

  CategoryGoodsList({this.code, this.message, this.data});

  CategoryGoodsList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<GoodsItem>();
      json['data'].forEach((v) {
        data.add(new GoodsItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoodsItem {
  String image;
  double oriPrice;
  double presentPrice;
  String goodsName;
  String goodsId;

  GoodsItem(
      {this.image,
        this.oriPrice,
        this.presentPrice,
        this.goodsName,
        this.goodsId});

  GoodsItem.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    goodsName = json['goodsName'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['goodsName'] = this.goodsName;
    data['goodsId'] = this.goodsId;
    return data;
  }
}
