import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BookmarkedState extends Equatable {
  final bool isBookmarked;

  BookmarkedState({@required this.isBookmarked});

  @override
  List<Object> get props => [isBookmarked];
}
