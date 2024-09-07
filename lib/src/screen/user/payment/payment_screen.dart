import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/screen/user/payment/widget/payment_mode_tile.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({super.key});

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  final List<String> _mode = ['UPI', 'COD'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  _getAppBar() {
    return AppBar(
      title: Text('Payment'),
    );
  }

  _getBody() {
    return Padding(
      padding: 8.padding,
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: _mode.length,
              itemBuilder: (context, index) {
                return PaymentModeTile(mode: _mode[index]);
              }),

          Spacer(),

          ElevatedButton(onPressed: (){}, child: Text("Place Order"))
        ],
      ),
    );
  }
}
