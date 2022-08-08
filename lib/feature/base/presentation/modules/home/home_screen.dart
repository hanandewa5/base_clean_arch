import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('test'.tr()),
            TextButton(
                onPressed: () {
                  print(context.locale.languageCode);
                  if (context.locale.languageCode == 'id') {
                    context.setLocale(const Locale('en', 'US'));
                  } else {
                    context.setLocale(const Locale('id', 'ID'));
                  }
                },
                child: const Text('TEST'))
          ],
        ),
      ),
    );
  }
}
