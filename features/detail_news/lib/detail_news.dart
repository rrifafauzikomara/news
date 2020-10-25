import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/ui/detail_news_page.dart';

class FeatureDetailNews extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          DetailNewsPage.routeName,
          child: (context, args) => DetailNewsPage(article: args.data),
        ),
      ];
}
