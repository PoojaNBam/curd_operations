import 'package:crud_operations/utils/app.dart';
import 'package:crud_operations/utils/colorr.dart';
import 'package:crud_operations/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget appBar(BuildContext context,
    {required String title, Function()? onSearch}) {
  return AppBar(
    backgroundColor: App.darkMode ? Colorr.bgDark : Colorr.bgLight,
    surfaceTintColor: App.darkMode ? Colorr.bgDark : Colorr.bgLight,
    centerTitle: true,
    titleSpacing: 5,
    forceMaterialTransparency: true,
    shape: const Border(bottom: BorderSide(color: Colorr.grey10, width: 1)),
    title: Text(title,
        textAlign: TextAlign.center,
        style: Styles.txtMedium(
            color: App.darkMode ? Colorr.white : Colorr.black)),
    actions: [
      Tap(
        onTap: () {
          if (onSearch != null) {
            onSearch();
          }
        },
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.search_rounded, size: 30)),
      )
    ],
  );
}

class VSpace extends StatelessWidget {
  final double space;

  const VSpace({super.key, this.space = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }
}

class HSpace extends StatelessWidget {
  final double space;

  const HSpace({super.key, this.space = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space);
  }
}

class Tap extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Widget? child;
  final Color? splashColor;
  final Color? overlayColor;

  const Tap(
      {super.key, this.onTap, this.child, this.splashColor, this.overlayColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: splashColor ?? Colorr.transparent,
      hoverColor: Colorr.transparent,
      overlayColor:
          MaterialStateProperty.all(overlayColor ?? Colorr.transparent),
      onTap: onTap,
      child: child,
    );
  }
}
