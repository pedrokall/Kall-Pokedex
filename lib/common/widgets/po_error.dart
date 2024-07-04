import 'package:flutter/material.dart';

class PoError extends StatelessWidget {
  const PoError({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error),
      ),
    );
  }
}
