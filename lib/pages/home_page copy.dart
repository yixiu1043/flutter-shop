import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText = '欢迎来到美好人间';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('美好人间'),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: typeController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        labelText: '美女类型',
                        helperText: '请输入你喜欢的类型'),
                    autofocus: false,
                  ),
                  ElevatedButton(onPressed: _choiceAction, child: Text('选择完毕')),
                  Text(
                    showText,
                    // Text 没有被外层组件包裹的时候，加一下overflow和maxLines进行限制一下
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _choiceAction() {
    print('开始选择你喜欢的类型');
    if (typeController.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('美女类型不能为空'),
              ));
    } else {
      getHttp(typeController.text.toString()).then((res) {
        print(res[0]['name']);
        setState(() {
          showText = res[0]['name'].toString();
        });
      });
    }
  }

  Future getHttp(String typeText) async {
    try {
      Response response;
      var data = {'postId': typeText};
      response = await Dio().get(
        'https://jsonplaceholder.typicode.com/comments',
        queryParameters: data,
      );
      return response.data;
    } catch (e) {}
  }
}
