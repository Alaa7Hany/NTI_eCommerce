import 'package:flutter/material.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';

import '../../../../core/utils/app_assets.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key, this.image});
  final Image? image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: ResponsiveHelper.w(context, width: 50),
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: image ?? Image.asset(AppAssets.profileImage, fit: BoxFit.cover),
      ),
    );
  }
}
