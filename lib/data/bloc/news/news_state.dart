import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news/data/model/article.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class Initial extends NewsState {
  @override
  List<Object> get props => [];
}

class Loading extends NewsState {
  @override
  List<Object> get props => [];
}

class NoData extends NewsState {
  final String message;

  NoData({@required this.message});

  @override
  List<Object> get props => [message];
}

class HasData extends NewsState {
  final ArticlesResult data;

  HasData({@required this.data});

  @override
  List<Object> get props => [data];
}

class NoInternetConnection extends NewsState {
  final String message;

  NoInternetConnection({@required this.message});

  @override
  List<Object> get props => [message];
}

class Error extends NewsState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
