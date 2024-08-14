import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp2024/screen/homepage/presentation/bloc/home_bloc.dart';
import 'package:newsapp2024/screen/homepage/presentation/bloc/home_event.dart';
import 'package:newsapp2024/screen/homepage/presentation/bloc/home_state.dart';
import 'package:newsapp2024/screen/homepage/presentation/widgets/news_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(FetchNews());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
          child: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          if (state is NewsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is NewsLoading) {
            return const CircularProgressIndicator();
          } else if (state is NewsError) {
            return Center(
              child: Text('Error+ ${state.message}'),
            );
          } else if (state is NewsLoaded) {
            return ListView.builder(
              itemCount: state.newsModel.totalResults,
              itemBuilder: (context, index) {
                return NewsTile(
                  title: state.newsModel.articles?[index].title ?? '',
                  description:
                      state.newsModel.articles?[index].description ?? '',
                  imageUrl: state.newsModel.articles?[index].urlToImage ?? '',
                );
              },
            );
          } else {
            return const Center(
              child: Text('No Data'),
            );
          }
        },
      )),
    );
  }
}
