import 'package:core/database/database_module.dart';
import 'package:detail_news/domain/usecases/detail_news_usecase.dart';
import 'package:detail_news/presentation/bloc/detail_news/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailNewsBloc extends Bloc<DetailNewsEvent, DetailNewsState> {
  final DetailNewsUseCase detailNewsUseCase;

  DetailNewsBloc({@required this.detailNewsUseCase}) : super(Initial());

  @override
  Stream<DetailNewsState> mapEventToState(DetailNewsEvent event) async* {
    if (event is SaveNews) {
      yield* _saveNews(event.data);
    } else if (event is DeleteNews) {
      yield* _deleteNews(event.data);
    } else if (event is GetBookmarkedByUrl) {
      yield* _getBookmarkedByUrl(event.url);
    }
  }

  Stream<DetailNewsState> _saveNews(NewsTableData newsTableData) async* {
    try {
      await detailNewsUseCase.saveNews(newsTableData);
      yield Success(message: "Bookmark");
    } catch (e) {
      yield Error(message: e.toString());
    }
  }

  Stream<DetailNewsState> _deleteNews(NewsTableData newsTableData) async* {
    try {
      await detailNewsUseCase.deleteNews(newsTableData);
      yield Success(message: "Delete Bookmark");
    } catch (e) {
      yield Error(message: e.toString());
    }
  }

  Stream<DetailNewsState> _getBookmarkedByUrl(String url) async* {
    try {

    } catch (e) {

    }
  }
}
