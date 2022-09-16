import 'dart:html';

import 'package:flash_demo/DeviceManager/colors.dart';
import 'package:flash_demo/DeviceManager/strings.dart';
import 'package:flash_demo/DeviceManager/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Type {
  emailOrPhone,
  password,
  signInPassword,
  userFName,
  userLName,
  phone,
  email,
  name,
  date,
  verifiedEmail,
  verifiedPhone,
  biography,
  location,
  otp,
  postalCode,
}

class RequireTextField extends StatefulWidget {
  final TextEditingController controller;
  final Type? type;
  final caption;
  var errorFree;
  final FocusNode? myFocusNode;
  final hintText;
  final mobileNumber;
  final readWriteStatus;
  final onTap;
  final labelText;
  final autoValidate;
  final autiSubmit;
  final verified;
  final suggetions;
  final autoKey;
  final isPast;
  final signInPassword;
  final double? boxHeight;
  final double? boxWidth;

  RequireTextField(
      {Key? key,
      this.type,
      required this.controller,
      this.caption,
      this.autiSubmit,
      this.autoKey,
      this.autoValidate,
      this.boxHeight,
      this.boxWidth,
      this.errorFree,
      this.hintText,
      this.isPast = false,
      this.labelText,
      this.mobileNumber,
      this.myFocusNode,
      this.onTap,
      this.signInPassword,
      this.verified = false,
      this.readWriteStatus,
      this.suggetions})
      : super(key: key);

  @override
  _RequireTextFieldState createState() => _RequireTextFieldState();
}

class _RequireTextFieldState extends State<RequireTextField> {
  late TextEditingController _controller;
  late Type type;
  var _value;
  bool _errorFree = true;
  bool validate = false;

  get errorFree => _errorFree;

  Type get _type => widget.type ?? _type;
  var searchTextField;

  TextEditingController get _thisController => widget.controller;
  late GlobalKey<NavigatorState> navigatorKey;
  bool indicator = true;

  @override
  void initState() {
    super.initState();
    navigatorKey = GlobalKey<NavigatorState>();
    if (widget.controller == null) {
      _controller = TextEditingController(text: "");
    } else {
      widget.controller.addListener(_handleControllerChanged);
    }
    if (widget.mobileNumber != null) {
      _thisController.text = widget.mobileNumber;
    }
  }

  void _handleControllerChanged() {
    if (_thisController.text != _value || _value.trim().isNotEmpty) {
      didChange(_thisController);
    }
  }

  didChange(var value) {
    setState(() {
      _value = value;
    });
  }

  @override
  void didUpdateWidget(RequireTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeListener(_handleControllerChanged);
      widget.controller.addListener(_handleControllerChanged);

      if (widget.controller == null) {
        _controller =
            TextEditingController.fromValue(oldWidget.controller.value);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case Type.password:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validatePassword,
            obscureText: indicator,
            style: TextStyles.subTitle,
            decoration: InputDecoration(
              errorMaxLines: 2,
              hintStyle: TextStyles.lowerSubTitle,
              suffixIcon: IconButton(
                icon: Icon(
                  indicator
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.iconColor,
                ),
                onPressed: () {
                  setState(() {
                    indicator = !indicator;
                  });
                },
              ),
              hintText: widget.labelText,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.textBoxColorGray),
                borderRadius: BorderRadius.circular(10),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.cardBackgroundColor),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      case Type.signInPassword:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validateSignInPassword,
            obscureText: indicator,
            style: TextStyles.subTitle,
            decoration: InputDecoration(
              errorMaxLines: 2,
              hintStyle: TextStyles.lowerSubTitle,
              suffixIcon: IconButton(
                icon: Icon(
                  indicator
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.iconColor,
                ),
                onPressed: () {
                  setState(() {
                    indicator = !indicator;
                  });
                },
              ),
              hintText: widget.labelText,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      case Type.emailOrPhone:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyles.subTitle,
            validator: validateEmailAndMobile,
            decoration: InputDecoration(
              //errorText: _value != null ? validateEmailAndMobile(_value) : null,
              hintStyle: TextStyles.lowerSubTitle,
              hintText: widget.labelText,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      case Type.phone:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
            autofocus: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyles.subTitle,
            validator: validateMobile,
            decoration: InputDecoration(
              //errorText: _value != null ? validateMobile(_value) : null,
              hintStyle: TextStyles.lowerSubTitle,
              hintText: widget.labelText,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      case Type.name:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyles.subTitle,
            decoration: InputDecoration(
              hintStyle: TextStyles.lowerSubTitle,
              hintText: widget.labelText,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      case Type.postalCode:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.number,
            autofocus: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyles.subTitle,
            decoration: InputDecoration(
              hintStyle: TextStyles.lowerSubTitle,
              hintText: widget.labelText,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      case Type.userFName:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyles.subTitle,
            validator: validateFName,
            decoration: InputDecoration(
              hintStyle: TextStyles.lowerSubTitle,
              hintText: widget.labelText,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      case Type.userLName:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyles.subTitle,
            validator: validateLName,
            decoration: InputDecoration(
              hintStyle: TextStyles.lowerSubTitle,
              hintText: widget.labelText,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      case Type.biography:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 5,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyles.subTitle,
            decoration: InputDecoration(
              hintStyle: TextStyles.lowerSubTitle,
              hintText: widget.labelText,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      case Type.verifiedPhone:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            readOnly: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validateMobile,
            style: TextStyles.subTitle,
            decoration: InputDecoration(
              suffixIcon: widget.verified
                  ? const Icon(
                      Icons.done_all_rounded,
                      color: AppColors.green,
                      size: 18,
                    )
                  : const Icon(
                      Icons.priority_high_rounded,
                      color: AppColors.red,
                      size: 18,
                    ),
              //errorText: _value != null ? validateMobile(_value) : null,
              hintStyle: TextStyles.lowerSubTitle,
              hintText: widget.labelText,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      case Type.email:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validateEmail,
            style: TextStyles.subTitle,
            decoration: InputDecoration(
              //errorText: _value != null ? validateEmail(_value) : null,
              hintStyle: TextStyles.lowerSubTitle,
              hintText: widget.labelText,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      case Type.verifiedEmail:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            readOnly: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validateEmail,
            style: TextStyles.subTitle,
            decoration: InputDecoration(
              suffixIcon: widget.verified
                  ? const Icon(
                      Icons.done_all_rounded,
                      color: AppColors.green,
                      size: 18,
                    )
                  : const Icon(
                      Icons.priority_high_rounded,
                      color: AppColors.red,
                      size: 18,
                    ),
              //errorText: _value != null ? validateEmail(_value) : null,
              hintStyle: TextStyles.lowerSubTitle,
              hintText: widget.labelText,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      case Type.otp:
        {
          return BoxEntryTextField();
        }
      default:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            focusNode: widget.myFocusNode,
            autofocus: false,
            maxLines: 1,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: widget.caption ?? AppLabels.appName.tr,
              hintStyle: const TextStyle(
                color: Colors.black45,
              ),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.textBoxColorGray,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.cardBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
    }
  }

  String? validatePassword(String? value) {
    String pattern =
        r"(^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&.*':;â‚¬#])[A-Za-z\d@$!%*?&.*':;â‚¬#]{8,}$)";
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value!)) {
      return AppLabels.passwordValidation.tr;
    }
    return "";
  }

  String? validateSignInPassword(String? value) {
    String pattern =
        r"(^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&.*':;â‚¬#])[A-Za-z\d@$!%*?&.*':;â‚¬#]{8,}$)";
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value!)) {
      return AppLabels.signInPasswordValidation.tr;
    }
    return "";
  }

  String? validateEmailAndMobile(String? value) {
    if (value!.length > 3) {
      if (value.isNumericOnly) {
        return validateMobile(value);
      } else {
        return validateEmail(value);
      }
    } else {
      validate = true;
      return AppLabels.emailOrRegMobile.tr;
    }
  }

  String? validateMobile(String? value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return AppLabels.mobileRequired.tr;
    } else if (value.length <= 8) {
      return AppLabels.mobile9Digits.tr;
    } else if (value.length > 10) {
      return AppLabels.mobile9Digits.tr;
    } else if (!regExp.hasMatch(value)) {
      return AppLabels.mobileDigits.tr;
    }
    return "";
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return AppLabels.emailRequired.tr;
    } else if (!regExp.hasMatch(value)) {
      return AppLabels.invalidEmail.tr;
    } else {
      return "";
    }
  }

  String? validateFName(String? value) {
    if (value!.isEmpty) {
      return AppLabels.fNameRequired.tr;
    } else {
      return "";
    }
  }

  String? validateLName(String? value) {
    if (value!.isEmpty) {
      return AppLabels.lNameRequired.tr;
    } else {
      return "";
    }
  }
}

class BoxEntryTextField extends StatefulWidget {
  final String? lastPin;
  final int fields;
  final ValueChanged<String>? onSubmit;
  final double fieldWidth;
  final double fontSize;
  final bool isTextObscure;
  final bool showFieldAsBox;
  final Color?
      cursorColor; // Leaving the data type dynamic for adding Color or Material Color
  final Color? boxColor;
  final Color? textColor;
  final Color? fillColor;
  final double? boxHeight;
  final double? boxWidth;

  const BoxEntryTextField({
    Key? key,
    this.lastPin,
    this.fields = 4,
    this.onSubmit,
    this.fieldWidth = 40.0,
    this.fontSize = 20.0,
    this.isTextObscure = false,
    this.showFieldAsBox = true,
    this.cursorColor = AppColors
        .primaryColor, // Adding a Material Color so that if the user want black, it get accepted too
    this.boxColor = AppColors.primaryColor,
    this.textColor = AppColors.titleBlack,
    this.fillColor = AppColors.textBoxColor,
    this.boxHeight,
    this.boxWidth,
  }) : super(key: key);

  @override
  State createState() {
    return BoxEntryTextFieldState();
  }
}

class BoxEntryTextFieldState extends State<BoxEntryTextField> {
  final List<String> _pin = <String>[];
  final List<FocusNode> _focusNodes = <FocusNode>[];
  final List<TextEditingController> _textControllers =
      <TextEditingController>[];

  Widget textFields = Container();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.fields; i++) {
      _textControllers.add(TextEditingController());
      _pin.add("");
      _focusNodes.add(FocusNode());
    }
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (var i = 0; i < widget.lastPin!.length; i++) {
            _pin[i] = widget.lastPin![i];
          }
        }
        textFields = generateTextFields(context);
      });
    });
  }

  @override
  void dispose() {
    for (var t in _textControllers) {
      t.dispose();
    }
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(widget.fields, (int i) {
      return buildTextField(i, context, i == 0);
    });

    FocusScope.of(context).requestFocus(_focusNodes[0]);

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  void clearTextFields() {
    for (var tEditController in _textControllers) {
      tEditController.clear();
    }
    _pin.clear();
  }

  Widget buildTextField(int i, BuildContext context, [bool autofocus = false]) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
      if (widget.lastPin != null) {
        _textControllers[i].text = widget.lastPin![i];
      }
    }

    _focusNodes[i].addListener(() {
      if (_focusNodes[i].hasFocus) {}
    });

    //final String lastDigit = _textControllers[i].text;

    return Container(
      width: widget.boxWidth,
      height: widget.boxHeight,
      margin: const EdgeInsets.all(5.0),
      child: TextField(
        controller: _textControllers[i],
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
          signed: false,
        ),
        textAlign: TextAlign.center,
        cursorColor: widget.cursorColor,
        maxLength: 1,
        autofocus: autofocus,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.textColor,
            // color: Colors.black,
            fontSize: widget.fontSize),
        focusNode: _focusNodes[i],
        obscureText: widget.isTextObscure,
        decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor,
            counterText: "",
            enabledBorder: widget.showFieldAsBox
                ? OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: widget.boxColor!))
                : null,
            focusedBorder: widget.showFieldAsBox
                ? OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: widget.boxColor!))
                : null),
        onChanged: (String str) {
          setState(() {
            _pin[i] = str;
          });
          if (i + 1 != widget.fields) {
            _focusNodes[i].unfocus();
            if (_pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            } else {
              FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
            }
          } else {
            _focusNodes[i].unfocus();
            if (_pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            }
          }
          if (_pin.every((String digit) => digit != '')) {
            widget.onSubmit!(_pin.join());
          }
        },
        onSubmitted: (String str) {
          if (_pin.every((String digit) => digit != '')) {
            widget.onSubmit!(_pin.join());
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textFields;
  }
}
