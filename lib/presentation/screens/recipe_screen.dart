import 'package:cookbook/presentation/widgets/buttons/bookmark_button.dart';
import 'package:cookbook/presentation/widgets/buttons/pop_button.dart';
import 'package:cookbook/presentation/widgets/icon_with_label.dart';
import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/splash.png"),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  const PopButton(),
                  const Spacer(),
                  BookmarkButton(
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.5,
            builder: (context, controller) => Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: ListView(
                  controller: controller,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        IconWithLabel(
                          label: "20 мин",
                          icon: Icons.access_time_sharp,
                        ),
                        IconWithLabel(
                          label: "6 персон",
                          icon: Icons.people_alt_outlined,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Salmon with couscous",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Предлагаю рецепт невероятно вкусного и очень нежного вишневого пирога. Угощайтесь!",
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Основные игредиенты",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ...List.generate(
                      6,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Text("${index + 1}: Индигридиент"),
                            const Spacer(),
                            const Text(
                              "По вкусу",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Этапы приготовления",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    ...List.generate(
                      4,
                      (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "# ШАГ 1/4",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Image.asset(
                            "assets/splash.png",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: size.width - 50,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Духовку нагрейте до 180°C. Форму для выпечки диаметром 26 см слегка смажьте маслом и посыпьте мукой. Яйца, сахар и ванильный сахар хорошо взбейте миксером. К смеси добавьте яйца и снова взбейте. Затем добавьте сметану и все тщательно перемешайте.",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
