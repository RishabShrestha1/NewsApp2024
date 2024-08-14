import 'package:newsapp2024/screen/homepage/domain/newsmodel.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {
  NewsInitial();
}

class NewsLoading extends NewsState {
  NewsLoading();
}

class NewsLoaded extends NewsState {
  final NewsModel newsModel;
  NewsLoaded(this.newsModel);
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);
}
