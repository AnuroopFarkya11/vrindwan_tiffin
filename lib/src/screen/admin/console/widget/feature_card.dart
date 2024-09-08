import 'package:flutter/material.dart';
import 'package:triton_extensions/triton_extensions.dart';

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const FeatureCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Icon(icon),
          ),
          10.space,
          Text(label)
        ],
      ),
    );
  }
}
