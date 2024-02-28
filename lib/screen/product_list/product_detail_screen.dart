import 'package:crud_operations/api/api.dart';
import 'package:crud_operations/utils/colorr.dart';
import 'package:crud_operations/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool _loading = false;
  String _description = "";
  double _price = 0.0;
  double _discountPercentage = 0.0;
  double _rating = 0.0;
  String _brand = "";
  String _category = "";
  String _thumbnail = "";
  List<String> _images = [];

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
    await _getProductDetail();
  }

  appBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Icon(Icons.arrow_back),
          Column(
            children: <Widget>[
              Text(
                _category,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colorr.black),
              ),
              Text(
                _brand,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colorr.black)),

            ],
          ),
          const Icon(Icons.production_quantity_limits),
        ],
      ),
    );
  }

  _mb() {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          appBar(),
          Center(
            child: Image.network(
              _thumbnail,
              height: 250,
            ),
          ),
          RatingBarIndicator(
            rating: _rating,
            itemCount: 5,
            itemSize: 15.0,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
          ),
          Text(_description),
          Text("$_discountPercentage"),
          Text("$_price"),
          /*Row(
            children: [
              Expanded(
                  child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    _images[index],
                    height: 100,
                  );
                },
              ))
            ],
          )*/
        ],
      ),
    ));
  }

  _getProductDetail() async {
    if (mounted) {
      setState(() {
        _loading = true;
      });
    }
    dynamic res = await Api.request(Api.productDetail, isGet: true);
    try {
      if (Api.resNotNull(res)) {
        _brand = res["brand"] ?? "";
        _description = res["description"] ?? "";
        _price = (res["price"] ?? 0).toDouble();
        _category = res["category"] ?? '';
        _thumbnail = res["thumbnail"] ?? '';
        _discountPercentage = (res["discountPercentage"] ?? 0.0).toDouble();
        _rating = (res["rating"] ?? 0.0).toDouble();
        _images = res['images'] ?? [];
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
