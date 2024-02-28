import 'package:crud_operations/screen/dashboard.dart';
import 'package:crud_operations/screen/product_list/product_detail_screen.dart';
import 'package:flutter/material.dart';

import '../splash_screen.dart';

class Routes {
  Routes._();

  static const String root = "/";
  static const String dashboard = "/dashboard";
  static const String productDetails = "/productDetails";

  static Map<String, WidgetBuilder> routes() {
    return {
      root: (context) => const SplashScreen(),
      dashboard: (context) => const Dashboard(),
      productDetails: (context) => const ProductDetails(),
    };
  }
}
