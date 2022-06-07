import 'package:cookbook/data/db/theme_store.dart';
import 'package:cookbook/domain/features/theme/theme_entities.dart';
import 'package:cookbook/domain/features/theme/theme_repository.dart';
import 'package:rxdart/rxdart.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  ThemeRepositoryImpl(this._themeStore);

  final ThemeStore _themeStore;

  @override
  late final BehaviorSubject<ThemeOption> theme =
      BehaviorSubject.seeded(_themeStore.userValue);

  @override
  Future<void> setTheme(ThemeOption option) async {
    theme.value = option;
  }
}
