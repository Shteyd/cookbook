import 'package:flutter/material.dart';

class PopButton extends StatelessWidget {
  const PopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFF8F8F8),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Color(0xFFAE1027),
        ),
      ),
    );
  }
}
