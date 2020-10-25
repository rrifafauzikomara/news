import 'package:flutter_modular/flutter_modular.dart';
import 'package:list_news/presentation/ui/list_news_page.dart';

class FeatureListNews extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          ListNewsPage.routeName,
          child: (context, args) => ListNewsPage(),
        ),
      ];
}
