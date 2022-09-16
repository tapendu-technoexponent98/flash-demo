import 'dart:io';

import 'package:flash_demo/DeviceManager/colors.dart';
import 'package:flutter/material.dart';

class LeadingBackButton extends StatelessWidget {
  final Function() onPressed;
  final Color? arrowColor;

  const LeadingBackButton({Key? key, required this.onPressed, this.arrowColor = AppColors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator.canPop(context)
        ? IconButton(
            icon: Icon(
              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
              size: 14,
              color: arrowColor,
            ),
            onPressed: onPressed)
        : const Offstage();
  }
}
