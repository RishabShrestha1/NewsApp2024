import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp2024/resources/app_color.dart';
import 'package:newsapp2024/resources/dimensions.dart';
import 'package:newsapp2024/screen/homepage/presentation/bloc/home_bloc.dart';
import 'package:newsapp2024/screen/homepage/presentation/bloc/home_event.dart';
import 'package:newsapp2024/screen/homepage/presentation/bloc/home_state.dart';
import 'package:newsapp2024/screen/homepage/presentation/widgets/category_tab.dart';
import 'package:newsapp2024/screen/homepage/presentation/widgets/news_tile.dart';
import 'package:newsapp2024/screen/homepage/presentation/widgets/shimmer_homescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(FetchNews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 24,
        scrolledUnderElevation: 0,
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 30,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/notification.svg',
                height: 20,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
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
              return const LoadingHomescreen();
            } else if (state is NewsError) {
              return Center(
                child: Text('Error+ ${state.message}'),
              );
            } else if (state is NewsLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          'Latest',
                          style: TextStyle(
                            fontSize: deviceHeight * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'See all',
                          style: TextStyle(
                            fontSize: deviceHeight * 0.02,
                            color: AppColor.graybodytext,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CategoryTab(),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.newsModel.articles.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index < state.newsModel.articles.length) {
                          final article = state.newsModel.articles[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: NewsTile(
                              title: article.title,
                              imageUrl: article.urlToImage ?? '',
                              source: article.source.name,
                              time: DateTime.now()
                                  .difference(article.publishedAt)
                                  .inHours
                                  .toString(),
                              content: article.content,
                              description: article.description ?? '',
                            ),
                          );
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('No Data'),
              );
            }
          },
        )),
      ),
    );
  }
}
