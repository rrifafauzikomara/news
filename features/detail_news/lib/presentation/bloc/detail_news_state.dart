import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DetailNewsState extends Equatable {
  const DetailNewsState();

  @override
  List<Object> get props => [];
}

class Initial extends DetailNewsState {}

class Success extends DetailNewsState {
  final String message;

  Success({@required this.message});

  @override
  List<Object> get props => [message];
}

class Error extends DetailNewsState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
