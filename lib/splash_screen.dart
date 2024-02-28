import 'dart:async';

import 'package:crud_operations/screen/dashboard.dart';
import 'package:crud_operations/utils/assets.dart';
import 'package:crud_operations/utils/colorr.dart';
import 'package:crud_operations/utils/custom_widgets.dart';
import 'package:crud_operations/utils/styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    if (context.mounted) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Dashboard())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return _mb(context);
  }

  _mb(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
            child: Column(
          children: [
            Text("CURD Operations",
                style: Styles.txtRegular(color: Colorr.primary,fontSize: 25)),
            const VSpace(),
            Image.asset(Assets.imgLogo),
          ],
        )),
      )),
    );
  }
}
