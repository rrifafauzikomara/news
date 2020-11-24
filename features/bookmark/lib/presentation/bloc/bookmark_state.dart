import 'package:core/database/database_module.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class Initial extends BookmarkState {}

class HasData extends BookmarkState {
  final List<NewsTableData> data;

  HasData({@required this.data});

  @override
  List<Object> get props => [data];
}

class NoData extends BookmarkState {
  final String message;

  NoData({@required this.message});

  @override
  List<Object> get props => [message];
}

class Error extends BookmarkState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
