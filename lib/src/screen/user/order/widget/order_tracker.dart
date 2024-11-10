import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';  // Import the easy_stepper package
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/screen/user/order/widget/order_status_step.dart';

class OrderTracker extends StatefulWidget {
  final ScrollController scrollController;
  const OrderTracker({super.key,required this.scrollController});

  @override
  State<OrderTracker> createState() => _OrderTrackerState();
}

class _OrderTrackerState extends State<OrderTracker> {
  int _currentStep = 0;
  // Current active step
  final List<OrderStep> _steps = [
    OrderStep("Order Placed", "We have received your order", Icons.check_box_outlined),
    OrderStep("Waiting For Confirmation", "Awaiting confirmation", Icons.payment_outlined),
    OrderStep("Order Processed", "We are preparing your order", Icons.work_outline),
    OrderStep("Out For Delivery", "Order #757578 from Tasty food", Icons.shopping_bag_outlined),
  ];

  void _nextStep() {
    if (_currentStep < _steps.length - 1) {
      setState(() {
        _currentStep++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.scrollController,
      shrinkWrap: true,
      itemCount: _steps.length,
      itemBuilder: (context, index) {
        return OrderStatusStep(
          step: _steps[index],
          isActive: index <= _currentStep,
          isLastStep: index == _steps.length - 1,
        );
      },
    );
  }
}
