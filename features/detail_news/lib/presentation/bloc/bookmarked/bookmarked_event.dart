import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class BookmarkedEvent extends Equatable {
  const BookmarkedEvent();

  @override
  List<Object> get props => [];
}

class GetBookmarked extends BookmarkedEvent {
  final String url;

  GetBookmarked({@required this.url});

  @override
  List<Object> get props => [url];
}
