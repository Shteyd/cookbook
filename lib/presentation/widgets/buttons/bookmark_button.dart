import 'package:flutter/material.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFF8F8F8),
        ),
        child: const Icon(
          Icons.bookmark,
          color: Color(0xFFAE1027),
        ),
      ),
    );
  }
}
