import 'package:cookbook/presentation/widgets/beautiful_container.dart';
import 'package:cookbook/presentation/widgets/buttons/pop_button.dart';
import 'package:cookbook/presentation/widgets/tiles/horizontal_recipe_tile.dart';
import 'package:cookbook/presentation/widgets/indent.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Indent(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Row(
                children: const [
                  PopButton(),
                  SizedBox(width: 5),
                  Expanded(
                    child: BeautifulContainer(
                      child: Text(
                        "Сохраненные рецепты",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.separated(
                  physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                  itemBuilder: (context, index) => const HorizontalRecipeTile(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  itemCount: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
