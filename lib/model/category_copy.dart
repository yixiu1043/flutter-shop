// https://javiercbk.github.io/json_to_dart/    JSON to Dart

class CategoryItemModel {
  String mallCategoryId; // 类别编号
  String mallCategoryName; // 类别名称
  List<dynamic> bxMallSubDto;
  Null comments;
  String image;

  CategoryItemModel({
    this.mallCategoryId,
    this.mallCategoryName,
    this.bxMallSubDto,
    this.comments,
    this.image
  });

  // dynamic 代表动态类型
  // 工厂构造方法，不用使用new关键字
  factory CategoryItemModel.fromJson(dynamic json) {
    return CategoryItemModel(
      mallCategoryId: json['mallCategoryId'],
      mallCategoryName: json['mallCategoryName'],
      bxMallSubDto: json['bxMallSubDto'],
      comments: json['comments'],
      image: json['image'],
    );
  }
}

class CategoryListModel {
  List<CategoryItemModel> data;

  CategoryListModel(this.data);

  factory CategoryListModel.fromJson(List json) {
    return CategoryListModel(
      json.map((i) => CategoryItemModel.fromJson(i)).toList()
    );
  }
}