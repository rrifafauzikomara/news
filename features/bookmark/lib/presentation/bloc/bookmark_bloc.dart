import 'package:bloc/bloc.dart';
import 'package:bookmark/domain/usecases/bookmark_usecase.dart';
import 'package:bookmark/presentation/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final BookmarkUseCase bookmarkUseCase;

  BookmarkBloc({@required this.bookmarkUseCase}) : super(Initial());

  @override
  Stream<BookmarkState> mapEventToState(BookmarkEvent event) async* {
    if (event is LoadBookmark) {
      yield* _loadBookmark();
    }
  }

  Stream<BookmarkState> _loadBookmark() async* {
    try {
      final data = await bookmarkUseCase.getListBookmark();
      if (data.isEmpty) {
        yield NoData(message: "No Bookmark");
      } else {
        yield HasData(data: data);
      }
    } catch (e) {
      yield Error(message: e.toString());
    }
  }
}
