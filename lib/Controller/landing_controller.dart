import 'package:flash_demo/Router/route_constants.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_file.dart';

class LandingController extends GetxController {
  void toLanding() async {}
  onLoginNow() {
    Get.toNamed(login);
  }

  onSignUp() {
    Get.toNamed(signup);
  }
}
