import 'package:flutter/material.dart';
import 'package:triton_extensions/triton_extensions.dart';

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const FeatureCard({super.key, required this.icon, required this.label,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Card(
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
      ),
    );
  }
}
