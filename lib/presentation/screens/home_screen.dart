import 'package:cookbook/presentation/widgets/indent.dart';
import 'package:cookbook/presentation/widgets/recipe_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Indent(
          child: Column(
            children: [
              const SizedBox(height: 25),
              const Text(
                "Что вы хотите сегодня приготовить?",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xFFF8F8F8),
                ),
                child: Row(
                  children: const [
                    SizedBox(width: 10),
                    Icon(
                      Icons.search_rounded,
                      size: 25,
                      color: Color(0xFFAE1027),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration:
                            InputDecoration.collapsed(hintText: "Рецепт"),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Text(
                    "Новые рецепты",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Все",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                      const RecipeTile(),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(width: 15),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
