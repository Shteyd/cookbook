import 'package:cookbook/presentation/route/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  runApp(const CookbookApp());
}

class CookbookApp extends StatelessWidget {
  const CookbookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteManager.getStarted,
      onGenerateRoute: RouteManager.generateRoute,
      theme: ThemeData(
        fontFamily: "OpenSans",
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

/*         _
       .__(.)< (MEOW)
        \___)   
 ~~~~~~~~~~~~~~~~~~ */
