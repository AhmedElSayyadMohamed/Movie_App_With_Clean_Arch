import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;
  const ErrorMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Center(
        child: Text(message),
      ),
    );
  }
}
