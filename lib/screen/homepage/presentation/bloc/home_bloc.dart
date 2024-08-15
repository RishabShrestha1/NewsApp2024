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
  }
  Future<void> fetchNews(FetchNews event, Emitter<NewsState> emit) async {
    try {
      emit(NewsLoading());
      final response = await apiHandler(
          "${ApiConst.baseUrl}${ApiConst.topHeadlines}?${ApiConst.sources}=${ApiConst.currentsource}&apiKey=${ApiConst.apiKey}",
          'Get');
      // log("Current Url= ${ApiConst.baseUrl}${ApiConst.everything}?${ApiConst.sources}=${ApiConst.currentsource}&apiKey=${ApiConst.apiKey}",
      //     name: 'NewsBloc');

      // log("Response: $response", name: 'NewsBloc');
      emit(NewsLoaded(NewsModel.fromJson(response)));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
