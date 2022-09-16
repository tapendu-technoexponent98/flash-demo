import 'package:flash_demo/DeviceManager/colors.dart';
import 'package:flash_demo/DeviceManager/screen_constants.dart';
import 'package:flash_demo/Widgets/leading_back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../DeviceManager/assets.dart';

class IFrame extends StatelessWidget {
  final Key? scaffoldKey;
  final Widget child;
  final bool onlyChildEnable;
  final bool hideLandingLogo;
  final bool enableBack;
  final double? positionLeft;
  final double? positionTop;
  final double? positionBot;
  final double? positionRight;
  final double? childPositionLeft;
  final double? childPositionTop;
  final double? childPositionBot;
  final double? childPositionRight;
  final Color primaryColor;
  final Color arrowColor;
  final String backgroundCube;
  final String centerImage;
  final Function()? onBackPressed;

  final Color? circleColor;
  final double? logoPositionLeft;
  final double? logoPositionTop;
  final double? logoPositionBot;
  final double? logoPositionRight;
  final double? logoHeight;
  const IFrame(
      {Key? key,
      required this.child,
      this.onlyChildEnable = false,
      this.positionLeft,
      this.positionTop,
      this.positionBot,
      this.positionRight,
      this.scaffoldKey,
      this.primaryColor = AppColors.primaryColor,
      this.circleColor = AppColors.primaryColorDash,
      this.hideLandingLogo = false,
      this.enableBack = false,
      this.onBackPressed,
      this.childPositionLeft,
      this.childPositionTop,
      this.childPositionBot,
      this.childPositionRight,
      this.arrowColor = AppColors.white,
      this.backgroundCube = Assets.randCube,
      this.centerImage = Assets.landingLogo,
      this.logoPositionLeft = 0,
      this.logoPositionTop = 0,
      this.logoPositionBot = 0,
      this.logoPositionRight = 0, this.logoHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.backgroundColor,
      body: onlyChildEnable
          ? SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Positioned.fill(
                      left: childPositionLeft,
                      bottom: childPositionBot,
                      right: childPositionRight,
                      top: childPositionTop,
                      child: child),
                ],
              ),
            )
          : SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    color: primaryColor,
                  ),
                  Positioned(
                    left: positionLeft,
                    top: positionTop,
                    right: positionRight,
                    bottom: positionBot,
                    child: Container(
                      height: ScreenConstant.defaultDialogHeight,
                      width: ScreenConstant.defaultDialogHeight,
                      decoration: BoxDecoration(
                        color: circleColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Container(
                      height: ScreenConstant.defaultDialogHeight,
                      width: ScreenConstant.defaultDialogHeight,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(backgroundCube),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  hideLandingLogo
                      ? const Offstage()
                      : Positioned(
                          left: logoPositionLeft,
                          top: logoPositionTop,
                          right: logoPositionRight,
                          //bottom: logoPositionBot,
                          child: Container(
                            height: logoHeight,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(centerImage),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                  enableBack
                      ? Positioned(
                          left: ScreenConstant.sizeMedium,
                          top: ScreenConstant.sizeXL,
                          child: LeadingBackButton(
                              arrowColor: arrowColor,
                              onPressed: onBackPressed ??
                                  () {
                                    Get.back();
                                  }),
                        )
                      : const Offstage(),
                  Positioned.fill(
                      left: childPositionLeft,
                      bottom: childPositionBot,
                      right: childPositionRight,
                      top: childPositionTop,
                      child: child),
                ],
              ),
            ),
    );
  }
}
