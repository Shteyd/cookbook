import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundBlurImage extends StatelessWidget {
  const BackgroundBlurImage({
    Key? key,
    required this.assetImg,
    required this.child,
  }) : super(key: key);

  final String assetImg;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetImg),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          child: child,
        ),
      ),
    );
  }
}
