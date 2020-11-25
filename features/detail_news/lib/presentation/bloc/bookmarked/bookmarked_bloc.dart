import 'package:bloc/bloc.dart';
import 'package:detail_news/domain/usecases/detail_news_usecase.dart';
import 'package:detail_news/presentation/bloc/bookmarked/bloc.dart';
import 'package:flutter/material.dart';

class BookmarkedBloc extends Bloc<BookmarkedEvent, BookmarkedState> {
  final DetailNewsUseCase detailNewsUseCase;

  BookmarkedBloc({@required this.detailNewsUseCase})
      : super(BookmarkedState(isBookmarked: false));

  @override
  Stream<BookmarkedState> mapEventToState(
    BookmarkedEvent event,
  ) async* {
    if (event is GetBookmarked) {
      try {
        final data = await detailNewsUseCase.getBookmarkedByUrl(event.url);
        yield BookmarkedState(isBookmarked: data.isBookmarked);
      } catch (e) {
        yield BookmarkedState(isBookmarked: false);
      }
    }
  }
}
