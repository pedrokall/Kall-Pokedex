import 'package:flutter/material.dart';

class HomeErrors extends StatelessWidget {
  const HomeErrors({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(error),
    ));
  }
}
