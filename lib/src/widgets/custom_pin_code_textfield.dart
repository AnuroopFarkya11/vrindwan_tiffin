import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vrindavantiffin/src/core/utils/size_utils.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';

// Ignore for file: must be immutable
class CustomPinCodeTextField extends StatelessWidget {
  final Alignment? alignment;
  final BuildContext context;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Function(String) onChanged;
  final FormFieldValidator<String>? validator;

  const CustomPinCodeTextField({
    Key? key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: pinCodeTextFieldWidget,
    )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
    appContext: context,
    controller: controller,
    length: 6,
    keyboardType: TextInputType.number,
    textStyle: textStyle ?? CustomTextStyle.bodyMediumRoboto2,
    hintStyle: hintStyle ?? CustomTextStyle.onError,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    enableActiveFill: true,
    useHapticFeedback: true,
    pinTheme: PinTheme(
      fieldWidth: 40.0.h,
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(10.0),
      inactiveFillColor: Theme.of(context).colorScheme.onError,
      inactiveColor: Theme.of(context).colorScheme.onError,
      selectedColor: appTheme.orangeA70001,
      selectedFillColor: Theme.of(context).colorScheme.onError,
      activeFillColor: Theme.of(context).colorScheme.onError,
      activeColor: Theme.of(context).colorScheme.onError,

    ),
    onChanged: (value) => onChanged(value),
    validator: validator,
  );
}
