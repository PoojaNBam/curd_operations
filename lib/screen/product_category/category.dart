import 'package:crud_operations/api/api.dart';
import 'package:crud_operations/screen/product_list/product.dart';
import 'package:crud_operations/utils/colorr.dart';
import 'package:crud_operations/utils/common.dart';
import 'package:crud_operations/utils/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_widget_function/function/utils.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<ProductList> _productListData = [];
  List<String> categories = [];
  String selectedCategory = "";
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    await _getProductCategory();
  }

  @override
  Widget build(BuildContext context) {
    return _mb();
  }

  _mb() {
    return Scaffold(
        appBar: appBar(
          context,
          title: "CURD Operations",
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Column(children: [
                        const Text("Select Catagory"),
                        DropdownButton<String>(
                          value: selectedCategory,
                          onChanged: (newValue) {
                            setState(() {
                              selectedCategory = newValue!;

                              if (Utils.equals(selectedCategory, "laptops")) {
                                _getSelectedProduct();
                              } else {
                                _productListData.clear();
                              }
                            });
                          },
                          items: categories
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: _productListData.length,
                                    itemBuilder: (context, index) {
                                      // listOfImage = _productListData[index].images;
                                      return _productListData.isNotEmpty &&
                                              !_loading
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      if (mounted) {
                                                        setState(() {});
                                                      }
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colorr
                                                                  .blue50 //width of border
                                                              ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Column(children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Image.network(
                                                                    _productListData[
                                                                            index]
                                                                        .thumbnail,
                                                                    height: 100,
                                                                  ),
                                                                  Text(
                                                                      _productListData[
                                                                              index]
                                                                          .title,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colorr.primary)),
                                                                  Text(
                                                                      "Discount :${_productListData[index].discountPercentage}",
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colorr.primary)),
                                                                  Text(
                                                                      "Price :${_productListData[index].price}",
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colorr.primary)),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                                child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                    _productListData[
                                                                            index]
                                                                        .description,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colorr
                                                                            .primary)),
                                                                Text(
                                                                    "Category:${_productListData[index].brand}",
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colorr
                                                                            .primary)),
                                                                RatingBarIndicator(
                                                                  rating: _productListData[
                                                                          index]
                                                                      .rating,
                                                                  itemCount: 5,
                                                                  itemSize:
                                                                      15.0,
                                                                  physics:
                                                                      const BouncingScrollPhysics(),
                                                                  itemBuilder:
                                                                      (context,
                                                                              _) =>
                                                                          const Icon(
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .amber,
                                                                  ),
                                                                ),
                                                                Text(
                                                                    "Stock:${_productListData[index].stock}",
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        color: Colorr
                                                                            .primary)),
                                                                const Text(
                                                                    "More Detail",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        color: Colorr
                                                                            .primary)),
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
                                    })),
                          ],
                        )
                      ]),
                    )))));
  }

  _getProductCategory() async {
    if (mounted) {
      setState(() {
        _loading = true;
      });
    }
    dynamic res = await Api.request(Api.productCategory, isGet: true);
    try {
      if (Api.resNotNull(res)) {
        categories = List<String>.from(res);
        selectedCategory = (categories.isNotEmpty ? categories[0] : null)!;
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

  _getSelectedProduct() async {
    if (mounted) {
      setState(() {
        _loading = true;
      });
    }
    _productListData = await ProductList.getProductListCategoryWise();

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }
}
