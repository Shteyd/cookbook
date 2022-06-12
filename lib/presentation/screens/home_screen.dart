import 'package:cookbook/presentation/route/route_manager.dart';
import 'package:cookbook/presentation/widgets/buttons/bookmark_button.dart';
import 'package:cookbook/presentation/widgets/custom_text_field.dart';
import 'package:cookbook/presentation/widgets/indent.dart';
import 'package:cookbook/presentation/widgets/tiles/vertical_recipe_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Indent(
          child: Column(
            children: [
              const SizedBox(height: 25),
              const Text(
                "Что вы хотите сегодня приготовить?",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      onTap: () =>
                          Navigator.of(context).pushNamed(RouteManager.search),
                      controller: searchController,
                    ),
                  ),
                  const SizedBox(width: 5),
                  BookmarkButton(
                    onTap: () =>
                        Navigator.of(context).pushNamed(RouteManager.favorite),
                  ),
                ],
              ),
              const SizedBox(height: 15),
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
                    onTap: () =>
                        Navigator.of(context).pushNamed(RouteManager.all),
                    child: Text(
                      "Все",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.separated(
                  physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) =>
                      const VerticalRecipeTile(),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(width: 15),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
