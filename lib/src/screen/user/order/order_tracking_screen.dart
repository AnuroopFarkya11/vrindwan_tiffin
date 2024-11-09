import 'package:flutter/material.dart';
import 'package:vrindavantiffin/src/screen/user/order/widget/order_tracker.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  // Define the steps with their labels and icons


  // Method to simulate step update (you can connect this to backend data)


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody()
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Track Order'),
    );
  }

  _buildBody() {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(child: OrderTracker()),
          // ElevatedButton(
          //   onPressed: _nextStep,
          //   child: const Text('Next Step'),
          // ),
        ],
      ),
    );
  }
}



// Custom painter for drawing a dotted line

