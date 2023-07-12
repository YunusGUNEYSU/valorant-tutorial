import 'package:flutter/material.dart';
import 'package:lineapps/config/localization/app_localization.dart';
import 'package:lineapps/config/theme/app_theme.dart';
import 'package:lineapps/features/views/splas_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: AppLocalization(),
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('tr','TR'),
        title: 'Valorant LineUp',
        theme: AppTheme.darkTheme,
        home: const SplashView());
  }
}
