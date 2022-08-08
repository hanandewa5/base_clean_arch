import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:base_clean_arch/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_text.dart';

showCustomSnackbar({
  required BuildContext context,
  required String text,
  Icon? icon,
  required Color color,
  SnackBarBehavior? behavior,
}) {

  Widget displaySnackBarNormal() {
    return NormalText(
      text: text,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: ColorConstants.white,
      maxLines: 3,
    );
  }

  Widget displaySnackBarWithIcon(Icon icon) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: NormalText(
            text: text,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorConstants.white,
            maxLines: 3,
          ),
        ),
      ],
    );
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: icon == null ? displaySnackBarNormal() : displaySnackBarWithIcon(icon),
      backgroundColor: color,
      dismissDirection: Responsive.isMobile(context) ? DismissDirection.vertical : DismissDirection.horizontal,
      behavior: behavior ?? SnackBarBehavior.floating,
      margin: Responsive.isMobile(context) ? null : EdgeInsets.only(bottom: 1.sh - 100.h, right: 8.w, left: 1.sw - 0.25.sw),
    ),
  );
}
