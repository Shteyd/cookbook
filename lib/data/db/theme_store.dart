import 'package:cookbook/data/db/base_store.dart';
import 'package:cookbook/domain/features/theme/theme_entities.dart';

class ThemeStore extends BaseStore<ThemeOption> {
  @override
  String get boxId => "theme";

  @override
  ThemeOption get defaultValue => ThemeOption.light;

  @override
  String get key => "option";
}
