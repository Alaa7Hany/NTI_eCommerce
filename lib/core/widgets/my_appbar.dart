import 'package:flutter/material.dart';

import '../helper/nav_helper.dart';
import '../utils/app_assets.dart';
import 'my_rotator.dart';

class MyAppBar {
  static AppBar appBar({String? title, TextStyle? titleStyle}) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Text(title ?? '', style: titleStyle),

      // Rotate the arrow in case of language change
      leading: InkWell(
        onTap: () {
          NavHelper.pop();
        },
        child: MyRotator(icon: AppAssets.arrowRightIcon),
      ),
    );
  }
}
