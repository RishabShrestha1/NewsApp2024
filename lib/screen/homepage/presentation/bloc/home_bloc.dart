import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:newsapp2024/resources/apiconstant.dart';
import 'package:newsapp2024/screen/homepage/domain/newsmodel.dart';

import 'package:newsapp2024/screen/homepage/presentation/bloc/home_event.dart';
import 'package:newsapp2024/screen/homepage/presentation/bloc/home_state.dart';
import 'package:newsapp2024/services/apihandler.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<FetchNews>(fetchNews);
    on<FetchNewsByCategory>(fetchNewsByCategory);
  }
  Future<void> fetchNews(FetchNews event, Emitter<NewsState> emit) async {
    try {
      emit(NewsLoading());
      final response = await apiHandler(
          "${ApiConst.baseUrl}${ApiConst.topHeadlines}?${ApiConst.sources}=${ApiConst.currentsource}&apiKey=${ApiConst.apiKey}",
          'Get');
      log("Current Url= ${ApiConst.baseUrl}${ApiConst.topHeadlines}?${ApiConst.sources}=${ApiConst.currentsource}&apiKey=${ApiConst.apiKey}",
          name: 'NewsBloc');
      emit(NewsLoaded(NewsModel.fromJson(response), category: 'All'));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  Future<void> fetchNewsByCategory(
      FetchNewsByCategory event, Emitter<NewsState> emit) async {
    DateTime today = DateTime.now();
    DateTime twoDaysAgo = today.subtract(const Duration(days: 2));

    String formattedDate =
        "${twoDaysAgo.toLocal().year}-${twoDaysAgo.toLocal().month.toString().padLeft(2, '0')}-${twoDaysAgo.toLocal().day.toString().padLeft(2, '0')}";
    try {
      emit(NewsLoading());
      final response = await apiHandler(
          "${ApiConst.baseUrl}${ApiConst.everything}?${ApiConst.query}=${event.category}&${ApiConst.from}=$formattedDate&${ApiConst.sources}=${ApiConst.bestsources}&${ApiConst.sortBy}=${ApiConst.sortParametes}&${ApiConst.pageSize}=${ApiConst.page}&apiKey=${ApiConst.apiKey}",
          'Get');
      log(
        "Current Url= ${ApiConst.baseUrl}${ApiConst.everything}?${ApiConst.query}=${event.category}&${ApiConst.from}=$formattedDate&${ApiConst.sources}=${ApiConst.bestsources}&${ApiConst.sortBy}=${ApiConst.sortParametes}&${ApiConst.pageSize}=${ApiConst.page}&apiKey=${ApiConst.apiKey}",
      );
      emit(NewsLoaded(NewsModel.fromJson(response), category: event.category));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
