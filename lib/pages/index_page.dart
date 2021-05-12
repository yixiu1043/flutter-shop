import 'package:flutter/material.dart'; // 安卓风格
import 'package:flutter/cupertino.dart'; // ios风格
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// StatefulWidget 页面有交互效果要使用动态组件
class IndexPage extends StatefulWidget {
  // @override告诉你说下面这个方法是从父类/接口 继承过来的，需要你重写一次，这样就可以方便你阅读，也不怕会忘记
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      label: '分类',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      label: '购物车',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      label: '会员中心',
    ),
  ];

  final List tabBodies = [HomePage(), CategoryPage(), CartPage(), MemberPage()];
  // final List<Widget> tabBodies = [HomePage(), CategoryPage(), CartPage(), MemberPage()];
  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = tabBodies[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: false);
    // print('设备的像素密度${ScreenUtil().pixelRatio}');
    // print('设备的高：${ScreenUtil().screenHeight}');
    // print('设备的宽：${ScreenUtil().screenWidth}');
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // tab类型
        currentIndex: currentIndex, // 当前选中的索引
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
      // body: IndexedStack(
      //   index: currentIndex,
      //   children: tabBodies,
      // ),
    );
  }
}
