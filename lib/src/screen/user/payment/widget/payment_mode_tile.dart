import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';

class PaymentModeTile extends ConsumerStatefulWidget {
  final String mode;

  const PaymentModeTile({super.key, required this.mode});

  @override
  ConsumerState<PaymentModeTile> createState() => _PaymentModeTileState();
}

class _PaymentModeTileState extends ConsumerState<PaymentModeTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "${widget.mode}",
        style: CustomTextStyle.titleLargeRobotoBluegray90001Regular,
      ),
    );
  }
}
