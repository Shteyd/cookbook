import 'package:cookbook/presentation/widgets/buttons/pop_button.dart';
import 'package:cookbook/presentation/widgets/custom_text_field.dart';
import 'package:cookbook/presentation/widgets/indent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../widgets/tiles/horizontal_recipe_tile.dart';

class SearchScreen extends HookWidget {
  const SearchScreen({
    Key? key,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final textController = controller ?? useTextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Indent(
          child: Column(
            children: [
              const SizedBox(height: 25),
              Row(
                children: [
                  const PopButton(),
                  const SizedBox(width: 5),
                  Expanded(
                    child: CustomTextField(
                      controller: textController,
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
