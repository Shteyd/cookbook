import 'package:cookbook/presentation/widgets/beautiful_container.dart';
import 'package:cookbook/presentation/widgets/buttons/pop_button.dart';
import 'package:cookbook/presentation/widgets/indent.dart';
import 'package:flutter/material.dart';

class NewRecipesScreen extends StatelessWidget {
  const NewRecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Indent(
          child: Column(
            children: [
              const SizedBox(height: 25),
              Row(
                children: const [
                  PopButton(),
                  SizedBox(width: 5),
                  Expanded(
                    child: BeautifulContainer(
                      child: Text(
                        "Новые рецепты",
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
            ],
          ),
        ),
      ),
    );
  }
}
