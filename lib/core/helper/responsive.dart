import 'package:flutter/cupertino.dart';

abstract class ResponsiveHelper {
  static final double _designWidth = 375;
  static final double _designHeight = 812;

  static double w(context, {required double width}) {
    return MediaQuery.of(context).size.width * (width / _designWidth);
  }

  static double h(context, {required double height}) {
    return MediaQuery.of(context).size.height * (height / _designHeight);
  }

  static double sp(BuildContext context, {required double fontSize}) {
    // Scale based on width
    return MediaQuery.of(context).size.width * (fontSize / _designWidth);
  }
}
