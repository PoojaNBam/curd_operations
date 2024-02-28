import 'dart:convert';
import 'dart:io';
import 'package:crud_operations/utils/common.dart';
import 'package:crud_operations/utils/constants.dart';
import 'package:flutter_widget_function/function/utils.dart';
import 'package:http/http.dart' as http;

class Api {
  Api._();

  //api call

  static const String productList = "products";
  static const String productDetail = "products/1";
  static const String productCategory = "products/categories";
  static const String productCategoryType = "products/category/laptops";
  static const String productAdd = "products/add";
  static const String productUpdate = "products/1";
  static const String productDelete = "products/1";
  static const String productSearch = "products/search?q=iPhone 15";

  //params
  static const String rData = "products";


  static bool resNotNull(dynamic res) {
    if (res == null) {
      return false;
    }
    return true;
  }

  static dynamic data(dynamic res) {
    return res[rData];
  }

  static Future<dynamic> request(
    String call, {
    bool isGet = false,
    bool isDelete = false,
    bool isPut = false,
    Map<String, String>? headers,
    dynamic body,
    bool isMultipartRequest = false,
    String fileDataParam = 'File',
  }) async {
    if (Utils.isNullOREmpty(call)) {
      Common.showToast("API calling error");
      return null;
    }
    if (!(await Common.isNetworkConnected())) {
      Common.showToast("Network Issue");
      return null;
    }

    try {
      String baseUrl = "${Constants.apiPath}$call";
      print(baseUrl);
      Map<String, String> header = headers ??
          {
            "Content-Type": "application/json",
          };
      http.Response response;
      if (isGet) {
        response = await http.get(Uri.parse(baseUrl), headers: header);
      } else {
        response = await http.post(Uri.parse(baseUrl),
            headers: header, body: (body != null) ? jsonEncode(body) : null);
      }

      if (response.statusCode == HttpStatus.ok) {
        dynamic res = jsonDecode(response.body);
        return res;
      } else {
        Common.showToast("Invalid");
        return null;
      }
    } catch (e) {
      Common.showToast("server error");
      return null;
    }
  }


}
