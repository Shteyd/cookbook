import 'package:cookbook/domain/features/theme/theme_entities.dart';
import 'package:rxdart/rxdart.dart';

abstract class ThemeRepository {
  ValueStream<ThemeOption> get theme;
  void update(ThemeOption option);
}
