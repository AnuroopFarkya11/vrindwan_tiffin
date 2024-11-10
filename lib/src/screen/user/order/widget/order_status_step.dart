import 'package:flutter/material.dart';
import 'package:vrindavantiffin/src/screen/user/order/widget/vertical_dotted_line.dart';
import 'package:vrindavantiffin/src/shared/theme/theme_helper.dart';

class OrderStep {
  final String title;
  final String subtitle;
  final IconData icon;

  OrderStep(this.title, this.subtitle, this.icon);
}

class OrderStatusStep extends StatefulWidget {
  final OrderStep step;
  final bool isActive;
  final bool isLastStep;
   OrderStatusStep({
    Key? key,
    required this.step,
    required this.isActive,
    required this.isLastStep,
  }) : super(key: key);

  @override
  State<OrderStatusStep> createState() => _OrderStatusStepState();
}

class _OrderStatusStepState extends State<OrderStatusStep> {

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            // Dot or active icon
            Icon(
              widget.isActive ? widget.step.icon : Icons.radio_button_unchecked,
              color: widget.isActive ? appTheme.lightGreen500  : Colors.grey,
            ),
            // Vertical dotted line to connect steps
            if (!widget.isLastStep)
              CustomPaint(
                painter: DottedLinePainter(widget.isActive ? appTheme.lightGreen500 : Colors.grey),
                child: SizedBox(
                  height: 80,
                  width: 2,
                ),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.step.title,
              style: TextStyle(
                fontSize: 18,
                color: widget.isActive ? appTheme.lightGreen500 : Colors.grey,
                fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Text(
              widget.step.subtitle,
              style: TextStyle(color: widget.isActive ? Colors.black : Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}