import 'package:core/database/database_module.dart';
import 'package:core/network/dio_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => Modular.get<DioClient>().dio),
        Bind((_) => DioClient(apiBaseUrl: "http://newsapi.org/v2")),
        Bind((_) => AppDatabase()),
      ];

  @override
  List<ModularRouter> get routers => [];
}
