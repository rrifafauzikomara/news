import 'package:bookmark/domain/repositories/bookmark_repository.dart';
import 'package:core/database/database_module.dart';
import 'package:flutter/cupertino.dart';

abstract class BookmarkUseCase {
  Future<List<NewsTableData>> getListBookmark();
}

class BookmarkUseCaseImpl extends BookmarkUseCase {
  final BookmarkRepository bookmarkRepository;

  BookmarkUseCaseImpl({@required this.bookmarkRepository});

  @override
  Future<List<NewsTableData>> getListBookmark() =>
      bookmarkRepository.getListBookmark();
}
