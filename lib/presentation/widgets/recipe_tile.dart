import 'package:flutter/material.dart';

import 'indent.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: AssetImage("assets/splash.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Indent(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Spacer(),
            Text(
              'Salmon with couscous',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Text(
              '20 мин',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
