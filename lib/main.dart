import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'base_screen.dart';
import 'core/colors.dart';
import 'core/resource/app_bindings.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.secondaryColor,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,

    ),
  );
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


    return GetMaterialApp(
      builder: (context, child){
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors.backgroundColor,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ), child: child!,);
      },
      title: 'Film Negar',
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa', 'IR'),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child:
        BaseScreen(),
      ),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Homa',
      ),
    );
  }
}
