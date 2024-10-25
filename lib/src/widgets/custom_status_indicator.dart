import 'package:flutter/material.dart';
import 'package:triton_extensions/triton_extensions.dart';
import 'package:vrindavantiffin/src/shared/theme/custom_text_style.dart';

enum Status { loading, success, error }

class StatusIndicator extends StatefulWidget {
  StatusIndicator({Key? key,String? message}) : super(key: key);

  // Create a global key to manage the state outside the widget
  static final GlobalKey<_StatusIndicatorState> statusKey = GlobalKey<_StatusIndicatorState>();

  // Expose a method that can be called to change the animation
  static void updateStatus(Status newStatus,{String? message}) {
    statusKey.currentState?.changeStatus(newStatus,message: message);
  }

  @override
  _StatusIndicatorState createState() => _StatusIndicatorState();
}

class _StatusIndicatorState extends State<StatusIndicator> {
  Status _status = Status.loading;
  late String? _message;

  // Method to change the status and rebuild the widget
  void changeStatus(Status newStatus,{String? message}) {
    setState(() {
      _status = newStatus;
      _message=message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: _buildContent(),
        ),
        50.space,
        Text(
          _status==Status.loading?"Hang tight! We’re placing your order...":_message??'',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: CustomTextStyle.titleMediumRobotoExtraBold,
        )
      ],
    );
  }

  Widget _buildContent() {
    switch (_status) {
      case Status.loading:
        return _buildLoader();
      case Status.success:
        return _buildSuccessTick();
      case Status.error:
        return _buildErrorIcon();
      default:
        return Container();
    }
  }

  Widget _buildLoader() {
    return CircleAvatar(
      radius: 150,
      child: CircularProgressIndicator(strokeWidth: 6),
    );
  }

  Widget _buildSuccessTick() {
    return CircleAvatar(
      radius: 150,
      backgroundColor: Colors.green,
      child: Icon(Icons.check, color: Colors.white, size: 120),
    );
  }

  Widget _buildErrorIcon() {
    return CircleAvatar(
      radius: 150,
      backgroundColor: Colors.red,
      child: Icon(Icons.error, color: Colors.white, size: 120),
    );
  }
}