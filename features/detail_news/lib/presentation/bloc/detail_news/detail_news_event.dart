import 'package:core/database/database_module.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class DetailNewsEvent extends Equatable {
  const DetailNewsEvent();

  @override
  List<Object> get props => [];
}

class SaveNews extends DetailNewsEvent {
  final NewsTableData data;

  SaveNews({@required this.data});

  @override
  List<Object> get props => [data];
}

class DeleteNews extends DetailNewsEvent {
  final NewsTableData data;

  DeleteNews({@required this.data});

  @override
  List<Object> get props => [data];
}
