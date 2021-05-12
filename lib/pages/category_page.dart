import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/child_category.dart';
import '../model/category.dart';
import '../service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:provide/provide.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品分类'),),
      body: Container(
        child: Row(
          children: [
            LeftCategoryNav(),
            Column(
              children: <Widget>[
                RightCategoryNav(),
                GoodsList()
              ],
            )
          ],
        )
      ),
    );
  }
}

// 左侧大类导航
class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list = [];
  var selectIndex = 0;

  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1, color: Colors.black12),
        )
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _leftInkWell(index);
        }
      ),
    );
  }

  Widget _leftInkWell (int index) {
    bool isClick = false;
    isClick = (index == selectIndex) ? true : false;
    return InkWell(
      onTap: (){
        var childList = list[index].bxMallSubDto;
        Provide.value<ChildCategory>(context).getChildCategory(childList);
        setState(() {
          selectIndex = index;
        });
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 15),
        decoration: BoxDecoration(
          color: isClick ? Color.fromRGBO(236, 236, 236, 1) : Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12)
          )
        ),
        child: Text(list[index].mallCategoryName, style: TextStyle(fontSize: ScreenUtil().setSp(28)),),
      ),
    );
  }

  void _getCategory () async {
    await request('getCategory').then((value) {
      var data = json.decode(value.toString());
      Category category = Category.fromJson(data);
      setState(() {
        list = category.data;
      });
      Provide.value<ChildCategory>(context).getChildCategory(list[0].bxMallSubDto);
    });
  }
}

class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  // List list = ['名酒', '宝丰', '北京二锅头', '大明', '舍得', '茅台', '五粮液'];

  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context, child, childCategory) {
        return Container(
          width: ScreenUtil().setWidth(570),
          height: ScreenUtil().setHeight(80),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.black12))
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: childCategory.childList.length,
            itemBuilder: (context, index) => _tabItem(childCategory.childList[index])
          )
        );
      },
    );
  }

  Widget _tabItem(CategoryItemSub item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(item.mallSubName, style: TextStyle(fontSize: ScreenUtil().setSp(28)),),
      ),
    );
  }
}

// 商品列表
class GoodsList extends StatefulWidget {
  @override
  _GoodsListState createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  @override
  void initState() {
    super.initState();
    _getGoodsList();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void _getGoodsList() async {
    var data = {
      'categoryId': 4,
      'categorySubId': '',
      'page': 1
    };
    await request('getMallGoods', formData: data).then((value) {
      var res = json.decode(value.toString());
      print('res$res');
    });
  }
}




