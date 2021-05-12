import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier {
  List<CategoryItemSub> childList = [];

  getChildCategory(List<CategoryItemSub> list) {
    CategoryItemSub all = CategoryItemSub();
    all.mallSubId = '00';
    all.mallCategoryId = '00';
    all.comments = 'null';
    all.mallSubName = '全部';
    childList = [all];
    childList.addAll(list);
    notifyListeners();
  }
}