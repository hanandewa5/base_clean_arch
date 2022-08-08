import 'dart:async';
import 'dart:io';

import 'package:base_clean_arch/core/configs/env/environment.dart';
import 'package:base_clean_arch/core/configs/themes/custom_theme.dart';
import 'package:base_clean_arch/core/constants/string_constants.dart';
import 'package:base_clean_arch/core/services/package_info_service.dart';
import 'package:base_clean_arch/feature/base/data/services/hive_service.dart';
import 'package:base_clean_arch/feature/base/domain/entities/user_state/user_state_entities.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/login_page.dart';
import 'package:base_clean_arch/injection/injection.dart' as injection;
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'injection/injection.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();
  await initConfig();
  HiveService hive = di<HiveService>();

  final bool isFirstTimeLaunch = await hive.getFirstTimeLaunch();
  final UserStateEntities? userStateEntities = await hive.getUserState();
  final String? locationName = await hive.getLocationName();
  late Widget _myApp;

  if (Platform.isAndroid || Platform.isIOS) {
    final bool jailBroken = await FlutterJailbreakDetection.jailbroken;
    if (!jailBroken) {
      if (!kReleaseMode) {
        _myApp = AndroidApp(
          firstTimeLaunch: isFirstTimeLaunch,
          userStateEntities: userStateEntities,
          locationName: locationName,
        );
      } else {
        _myApp = AndroidApp(
          firstTimeLaunch: isFirstTimeLaunch,
          userStateEntities: userStateEntities,
          locationName: locationName,
        );
        // await SentryFlutter.init(
        //       (options) => options
        //     ..dsn = ''
        //     ..environment = Environment.name
        //     ..release = Environment.release,
        //   appRunner: () => runApp(
        //     AndroidApp(
        //       firstTimeLaunch: isFirstTimeLaunch,
        //       userStateEntities: userStateEntities,
        //       locationName: locationName,
        //     ),
        //   ),
        // );
      }
    } else {
      _myApp = const JailbreakApp();
    }
  } else {
    _myApp = DevicePreview(
      enabled: false,
      availableLocales: const [Locale('id_ID')],
      builder: (context) {
        return AndroidApp(
          firstTimeLaunch: isFirstTimeLaunch,
          userStateEntities: userStateEntities,
          locationName: locationName,
        );
      },
    );
  }

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('id', 'ID'),
        ],
        path: 'assets/languages',
        fallbackLocale: const Locale('id', 'ID'),
        child: _myApp),
  );
}

Future<void> initConfig() async {
  environment.initConfig();
  await injection.init();
  HiveService hive = di<HiveService>();
  await hive.init();
  await packageInfoService.init();
  // initializeDateFormatting('id_ID', null);
}

class AndroidApp extends StatelessWidget {
  final bool? firstTimeLaunch;
  final String? locationName;
  final UserStateEntities? userStateEntities;

  const AndroidApp({
    Key? key,
    this.firstTimeLaunch = true,
    this.locationName,
    this.userStateEntities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (ctx, child) {
        return MaterialApp(
          title: Environment.appTitle,
          darkTheme: CustomTheme().customLight,
          theme: CustomTheme().customLight,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: (context, widget) {
            return MediaQuery(
              ///Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: firstTimeLaunch!
          ? const LoginPage()
          : LoginPage(
              userStateEntities: userStateEntities,
              locationName: locationName,
            ),
    );
  }
}

class IosApp extends StatelessWidget {
  const IosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: Environment.appTitle,
      home: const Scaffold(
        body: Center(
          child: Text(StringConstants.errorDeviceNotSupported),
        ),
      ),
    );
  }
}

class JailbreakApp extends StatelessWidget {
  const JailbreakApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: StringConstants.appTitle,
      home: Scaffold(
        body: JailBreakPage(),
      ),
    );
  }
}

class JailBreakPage extends StatelessWidget {
  const JailBreakPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 10), () {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => true,
            child: Dialog(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      StringConstants.labelSecurityWarning,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      StringConstants.errorDeviceJailBroken,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ).then((value) => {SystemNavigator.pop()});
    });
    return Container();
  }
}
