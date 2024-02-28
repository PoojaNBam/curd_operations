import 'package:crud_operations/api/api.dart';
import 'package:crud_operations/utils/colorr.dart';
import 'package:crud_operations/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:crud_operations/utils/custom_widgets.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  int _id = 0;
  String _productName = "";
  String _description = "";
  double _price = 0.0;
  double _rating = 0.0;
  int _stock = 0;
  String _brand = "";
  String _category = "";

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
    await _getAddProduct();
  }

  _mb() {
    return Scaffold(
        appBar: appBar(
          context,
          title: "CURD Operations",
        ),
        body: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

         /*   Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceAround,
              children: [
                InkWell(
                  onTap: () {
                  //  _productUpdate();
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
                    //  _productDelete();
                    },
                    child: const Icon(
                      Icons.delete,
                      size: 30,
                    )),
              ],
            ),*/


            const Text("Insert Data :-", style: TextStyle(
                fontSize: 18,
                color: Colorr.black)),

            Text("Product ID: $_id", style: const TextStyle(
                fontSize: 16,
                color: Colorr.black)),
            Text("Product Title: $_productName", style: const TextStyle(
                fontSize: 16,
                color: Colorr.black)),
            Text("Product price: $_price", style: const TextStyle(
                fontSize: 16,
                color: Colorr.black)),
            Text("Product rating: $_rating", style: const TextStyle(
                fontSize: 16,
                color: Colorr.black)),
            Text("Product Description: $_description", style: const TextStyle(
                fontSize: 16,
                color: Colorr.black)),
            Text("Product Brand: $_brand", style: const TextStyle(
                fontSize: 16,
                color: Colorr.black)),
            Text("Product Stock: $_stock", style: const TextStyle(
                fontSize: 16,
                color: Colorr.black)),
            Text("Product category: $_category", style: const TextStyle(
                fontSize: 16,
                color: Colorr.black)),
          ],
        )));
  }

  _getAddProduct() async {


    var body = {
      "title": "iPhone 15",
      "description": "An apple mobile which is nothing like apple",
      "price": 150000,
      "discountPercentage": 12.96,
      "rating": 4.69,
      "stock": 94,
      "brand": "Apple",
      "category": "smartphones"
    };
    dynamic res = await Api.request(Api.productAdd, body: body);
    try {
      if (Api.resNotNull(res)) {
        _id = res["id"] ?? 0;
        _productName = res["title"] ?? "";
        _brand = res["brand"] ?? "";
        _stock = res["stock"] ?? 0;
        _description = res["description"] ?? "";
        _price = (res["price"] ?? 0).toDouble();
        _category = res["category"] ?? '';
        _rating = (res["rating"] ?? 0.0).toDouble();

        Common.showToast("Product Insert successfully");
      }
    } catch (_) {
      Common.showToast("DataParse");
    }
    if (context.mounted) {
      setState(() {

      });
    }
  }
}
