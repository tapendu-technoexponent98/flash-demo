import 'package:flash_demo/Router/route_constants.dart';
import 'package:flash_demo/Views/landing.dart';
import 'package:flash_demo/Views/login.dart';
import 'package:flash_demo/Views/signup.dart';
import 'package:flash_demo/Views/splash.dart';
import 'package:get/get.dart';

class NavigationRouter {
  static final generateRoute = [
    GetPage(name: splash, page: ()=> const Splash()),
    GetPage(name: login, page: ()=>const Login()),
    GetPage(name:signup, page:()=>const SignUp()),
    GetPage(name: landing, page:()=> Landing()),
  ];
}
