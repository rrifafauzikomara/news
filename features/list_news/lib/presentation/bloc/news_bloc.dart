import 'dart:io';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:list_news/domain/usecases/news_usecase.dart';
import 'package:list_news/presentation/bloc/bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsUseCase newsUseCase;

  NewsBloc({@required this.newsUseCase}) : super(Initial());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is LoadData) {
      yield* _loadNews();
    }
  }

  Stream<NewsState> _loadNews() async* {
    try {
      yield Loading();
      var article = await newsUseCase.getListArticle();
      if (article.isEmpty) {
        yield NoData(message: 'No Data');
      } else {
        yield HasData(data: article);
      }
    } on IOException {
      yield NoInternetConnection(message: 'No Internet Connection');
    } on TimeoutException {
      yield NoInternetConnection(message: 'No Internet Connection');
    } catch (e) {
      yield Error(message: e.toString());
    }
  }
}
