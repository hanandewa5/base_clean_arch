import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  // final Widget? desktop;

  const Responsive({
    Key? key,
    @required this.mobile,
    @required this.tablet,
    // @required this.desktop,
  }) : super(key: key);

  // This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 600;

  // static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    // ]);
    // ScreenUtil.init(
    //   context,
    //   designSize: const Size(1024, 768),
    //   minTextAdapt: true,
    // );
    if (isMobile) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      ScreenUtil.init(
        context,
        designSize: const Size(375, 812),
        minTextAdapt: true,
      );
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
      ScreenUtil.init(
        context,
        designSize: const Size(1024, 768),
        minTextAdapt: true,
      );
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isMobile) {
          return mobile!;
        } else {
          return tablet!;
        }
      },
    );
  }
}
