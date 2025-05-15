import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

import '../cache/cache_data.dart';
import '../cache/cache_keys.dart';
import 'svg_wrapper.dart';

class MyRotator extends StatelessWidget {
  const MyRotator({super.key, required this.icon, this.isEn = false});
  final String icon;
  final bool isEn;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle:
          CacheData.lang == CacheKeys.keyAR
              ? (isEn ? math.pi : 0)
              : (isEn ? 0 : math.pi),
      child: SvgWrapper(assetName: icon, fit: BoxFit.scaleDown),
    );
  }
}
