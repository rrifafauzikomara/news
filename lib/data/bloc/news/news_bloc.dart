import 'dart:io';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news/data/api/api_service.dart';
import 'package:news/data/bloc/news/news_event.dart';
import 'package:news/data/bloc/news/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiService apiService;

  NewsBloc({@required this.apiService}) : super(Initial());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is LoadData) {
      yield* _loadNews();
    }
  }

  Stream<NewsState> _loadNews() async* {
    try {
      yield Loading();
      var article = await apiService.getListArticle();
      if (article.articles.isEmpty) {
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
