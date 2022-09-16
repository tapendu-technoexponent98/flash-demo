import 'package:flash_demo/DeviceManager/colors.dart';
import 'package:flash_demo/DeviceManager/custom_error.dart';
import 'package:flash_demo/DeviceManager/strings.dart';
import 'package:flash_demo/Router/navigation_router.dart';
import 'package:flash_demo/Router/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (BuildContext context, Widget? widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomError(
            errorDetails: errorDetails,
          );
        };
        return widget!;
      },
      debugShowCheckedModeBanner: false,
      initialRoute: splash,
      defaultTransition: Transition.native,
      getPages: NavigationRouter.generateRoute,
      title: AppLabels.appName.tr,
      theme: ThemeData(
          primaryColor: AppColors.matColor,
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
