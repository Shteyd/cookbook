import 'package:cookbook/presentation/route/route_manager.dart';
import 'package:cookbook/presentation/widgets/background_blur_image.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundBlurImage(
        assetImg: "assets/splash.png",
        child: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 50),
                      Text(
                        "Наслаждайтесь готовкой",
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                        ),
                      ),
                      Text(
                        "Тут вы найдете много вкусных и полезных рецептов",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      RouteManager.home,
                      // (_) => false,
                    ),
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      height: 60,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 25,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          "Начнем!",
                          style: TextStyle(
                            color: Color(0xFFAE1027),
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
