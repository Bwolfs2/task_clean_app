import 'package:flutter_modular/flutter_modular.dart';
import 'splash_page.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashPage()),
      ];
}
