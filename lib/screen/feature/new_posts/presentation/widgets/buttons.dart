import 'package:flutter/material.dart';

class PostBtnWidget extends StatelessWidget {
  const PostBtnWidget({
    super.key,
    required this.backgroundColor,
    required this.child,
    required this.onPressed,
  });

  final void Function() onPressed;
  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(
              color: Color(0xffD9E6F0),
            ),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
