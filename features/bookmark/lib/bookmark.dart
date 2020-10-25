import 'package:bookmark/presentation/ui/favorite_news_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FeatureBookmarkModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          FavoriteNewsPage.routeName,
          child: (context, arg) => FavoriteNewsPage(),
        ),
      ];
}
