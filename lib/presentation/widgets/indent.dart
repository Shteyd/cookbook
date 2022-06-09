import 'package:flutter/material.dart';

class Indent extends StatelessWidget {
  const Indent({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: child,
    );
  }
}
