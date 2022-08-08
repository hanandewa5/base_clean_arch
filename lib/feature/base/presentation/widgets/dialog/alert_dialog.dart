import 'package:base_clean_arch/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_button.dart';
import '../custom_text.dart';

showAlertDialog(BuildContext context, Icon icons, String title, String content, Function() onPositiveTap) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
        child: Wrap(
          children: [
            SizedBox(
              width: 0.35.sw,
              child: Padding(
                padding: EdgeInsets.all(24.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        icons,
                        SizedBox(
                          height: 8.h,
                        ),
                        NormalText(
                          text: title,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorConstants.black,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        NormalText(
                          text: content,
                          fontSize: 12.sp,
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w400,
                          color: ColorConstants.outline,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomPrimaryButton(
                                label: 'Batal',
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                textColor: ColorConstants.black,
                                outlineColor: ColorConstants.outlineColor,
                                type: ButtonType.large,
                                style: ButtonStyles.outlined,
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                              child: CustomPrimaryButton(label: 'Ya', onPressed: onPositiveTap),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
