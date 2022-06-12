import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextField extends HookWidget {
  const CustomTextField({
    Key? key,
    this.onTap,
    this.onEditingComplete,
    this.controller,
  }) : super(key: key);

  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF8F8F8),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: const Icon(
              Icons.search_rounded,
              size: 25,
              color: Color(0xFFAE1027),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              cursorColor: const Color(0xFFAE1027),
              decoration: const InputDecoration.collapsed(
                hintText: "Рецепт",
              ),
              controller: controller,
              onEditingComplete: onEditingComplete,
            ),
          ),
        ],
      ),
    );
  }
}
