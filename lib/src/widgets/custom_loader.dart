import 'package:flutter/material.dart';

class LoaderWithTick extends StatefulWidget {
  @override
  _LoaderWithTickState createState() => _LoaderWithTickState();
}

class _LoaderWithTickState extends State<LoaderWithTick> with SingleTickerProviderStateMixin {
  bool isLoading = true;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController for bounce effect
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    // Set up a scale animation to create bounce effect
    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    // Simulate an API call delay
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
      _controller.forward(); // Start the bounce animation
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildLoader() {
    return CircleAvatar(
      radius: 75,
      child: CircularProgressIndicator(
        color: Colors.blueAccent,
        strokeWidth: 6,
      ),
    );
  }

  Widget _buildSuccessTick() {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: CircleAvatar(
        radius: 75,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: isLoading ? _buildLoader() : _buildSuccessTick(),
      ),
    );
  }
}
