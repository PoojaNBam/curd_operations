import 'dart:io';
import 'package:crud_operations/api/api.dart';
import 'package:crud_operations/screen/product_list/product.dart';
import 'package:crud_operations/utils/colorr.dart';
import 'package:crud_operations/utils/common.dart';
import 'package:crud_operations/utils/constants.dart';
import 'package:crud_operations/utils/custom_widgets.dart';
import 'package:crud_operations/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:navigator_plus/navigate.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<ProductList> _productListData = [];
  List<ProductList> _fList = [];
  List<String> listOfImage = [];
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return _mb();
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    listOfImage.clear();
    await _getProductList();
  }

  _mb() {
    return SafeArea(
        child: Scaffold(
      appBar: appBar(context, title: "CURD Operations", onSearch: () {
        _getProductSearchList();
      }),
      body: Column(children: [
        Expanded(child: _productList()),
      ]),
    ));
  }

  _productList() {
    return SafeArea(
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _fList.length,
                      itemBuilder: (context, index) {
                        listOfImage = _fList[index].images;
                        return _fList.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (mounted) {
                                          setState(() {
                                            NavigatorName.to(
                                                context, Routes.productDetails);
                                          });
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colorr
                                                    .blue50 //width of border
                                                ),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.network(
                                                      _fList[index].thumbnail,
                                                      height: 100,
                                                    ),
                                                    Text(_fList[index].title,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            color: Colorr
                                                                .primary)),
                                                    Text(
                                                        "Discount :${_fList[index].discountPercentage}",
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            color: Colorr
                                                                .primary)),
                                                    Text(
                                                        "Price :${_fList[index].price}",
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            color: Colorr
                                                                .primary)),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                  child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          _productUpdate();
                                                        },
                                                        child: const Icon(
                                                          Icons
                                                              .security_update_good,
                                                          size: 30,
                                                        ),
                                                      ),
                                                      const HSpace(),
                                                      InkWell(
                                                          onTap: () {
                                                            _productDelete();
                                                          },
                                                          child: const Icon(
                                                            Icons.delete,
                                                            size: 30,
                                                          )),
                                                    ],
                                                  ),
                                                  const VSpace(),
                                                  Text(
                                                      _fList[index].description,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colorr.primary)),
                                                  Text(
                                                      "Category:${_fList[index].brand}",
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          color:
                                                              Colorr.primary)),
                                                  RatingBarIndicator(
                                                    rating:
                                                        _fList[index].rating,
                                                    itemCount: 5,
                                                    itemSize: 15.0,
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                  ),
                                                  Text(
                                                      "Stock:${_fList[index].stock}",
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              Colorr.primary)),
                                                  const Text("More Detail",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              Colorr.primary)),
                                                ],
                                              )),
                                            ],
                                          ),
                                          /*   Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemCount:
                                                          listOfImage.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Expanded(
                                                                child: Image
                                                                    .network(
                                                              listOfImage[
                                                                  index],
                                                              height: 50,
                                                            ))
                                                          ],
                                                        );
                                                      })),
                                            ],
                                          ),*/
                                        ]),
                                      ),
                                    ),
                                    //   _itemAndonList(_fList[index].expand, _fList, index),
                                  ],
                                ),
                              )
                            : const CircularProgressIndicator();
                      })
                ]))));
  }

  _getProductList() async {
    if (mounted) {
      setState(() {
        _loading = true;
      });
    }
    _productListData = await ProductList.getProductList();
    _fList = _productListData;

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  _productUpdate() async {
    const url = "${Constants.apiPath}${Api.productUpdate}"; // Replace with your API endpoint

    var request = http.MultipartRequest('PUT', Uri.parse(url));

    request.fields['title'] = 'iphone 15';

    try {
      var response = await request.send();

      if (response.statusCode == HttpStatus.ok) {

        Common.showToast("Product Update successfully ${await response.stream.bytesToString()}");
      } else {
        print('Request failed with status: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error during request: $error');
    }

    setState(() {});
  }

  _productDelete() async {
    const url =
        "${Constants.apiPath}${Api.productDelete}"; // Replace with your API endpoint

    var request = http.MultipartRequest('DELETE', Uri.parse(url));

    request.fields['title'] = 'iphone 15';

    try {
      var response = await request.send();

      if (response.statusCode == HttpStatus.ok) {
        print(await response.stream.bytesToString());
        Common.showToast("Product Delete successfully ${await response.stream.bytesToString()}");
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during request: $error');
    }

    setState(() {});
  }

  _getProductSearchList() async {
    if (mounted) {
      setState(() {
        _loading = true;
      });
    }
    dynamic res = await Api.request(Api.productSearch, isGet: true);
    try {
      if (Api.resNotNull(res)) {
        Common.showToast("No List Found");
        _fList.clear();
      }
    } catch (_) {
      Common.showToast("DataParse");
    }

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }
}
