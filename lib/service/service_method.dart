import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

// http 请求封装
// {formData} 用花括号包住代表可选参数
Future request(url, {formData}) async {
  print('开始获取数据了>>>>>>>>$url');
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;

    response = formData == null ? await dio.post(servicePath[url]) : await dio.post(servicePath[url], data: formData);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('Error: ==========>$e');
  }
}

// 获取首页主题内容
Future getHomePageContent() async {
  print('开始获取首页数据了');
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;

    var formData = {'lon': '115.02932', 'lat': '35.76189'};

    response = await dio.post(servicePath['homePageContent'], data: formData);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('Error: ==========>$e');
  }
}

// 火爆专区
Future getHomePageBlowConten() async {
  print('开始获取火爆专区数据了');
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    int page = 1;

    response = await dio.post(servicePath['homePageBelowConten'], data: page);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('Error: ==========>$e');
  }
}
