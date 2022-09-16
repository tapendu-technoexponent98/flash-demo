import 'dart:async';

import 'package:flash_demo/DeviceManager/assets.dart';
import 'package:flash_demo/Widgets/i_frame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  var _visible = true;

  startTime() async {
    var _duration = const Duration(seconds: 3);
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    animation.addListener(() => setState(() {}));
    animationController.forward();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return IFrame(
      onlyChildEnable: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.splashLogo,
            height: animation.value * 250,
            width: animation.value * 250,
          ),
        ],
      ),
    );
  }
}
