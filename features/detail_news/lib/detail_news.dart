import 'package:core/database/database_module.dart';
import 'package:detail_news/data/local/datasource/detail_news_data_source.dart';
import 'package:detail_news/data/repositories/detail_news_repository_impl.dart';
import 'package:detail_news/domain/repositories/detail_news_repository.dart';
import 'package:detail_news/domain/usecases/detail_news_usecase.dart';
import 'package:detail_news/presentation/bloc/bookmarked/bloc.dart';
import 'package:detail_news/presentation/bloc/detail_news/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/ui/detail_news_page.dart';

class FeatureDetailNews extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => DetailNewsLocal(appDatabase: Modular.get<AppDatabase>())),
        Bind((_) => DetailNewsRepositoryImpl(
            dataSource: Modular.get<DetailNewsDataSource>())),
        Bind((_) => DetailNewsUseCaseImpl(
            newsRepository: Modular.get<DetailNewsRepository>())),
        Bind((_) => DetailNewsBloc(
            detailNewsUseCase: Modular.get<DetailNewsUseCase>())),
        Bind((_) => BookmarkedBloc(
            detailNewsUseCase: Modular.get<DetailNewsUseCase>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          DetailNewsPage.routeName,
          child: (context, args) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => Modular.get<DetailNewsBloc>(),
              ),
              BlocProvider(
                create: (context) => Modular.get<BookmarkedBloc>(),
              ),
            ],
            child: DetailNewsPage(article: args.data),
          ),
        ),
      ];
}
