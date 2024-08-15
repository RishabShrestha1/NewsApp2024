import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  void onCategoryTap(String category) {
    if (category == 'All') {
      context.read<NewsBloc>().add(FetchNews());
    } else {
      context.read<NewsBloc>().add(FetchNewsByCategory(category));
    }
  }

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
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: 32.sp,
              width: 32.sp,
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
                  width: 18.sh,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 8.sp),
              CategoryTab(onCategorySelected: onCategoryTap),
              SizedBox(height: 8.sp),
              BlocConsumer<NewsBloc, NewsState>(
                listener: (context, state) {
                  if (state is NewsError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is NewsLoading) {
                    return const LoadingHomescreen();
                  } else if (state is NewsError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else if (state is NewsLoaded) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.newsModel.articles.length,
                      itemBuilder: (context, index) {
                        final article = state.newsModel.articles[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0.sp),
                          child: NewsTile(
                            title: article.title,
                            imageUrl: article.urlToImage ?? '',
                            source: article.source.name,
                            time: (DateTime.now()
                                        .difference(article.publishedAt)
                                        .inHours) >
                                    26
                                ? '${DateTime.now().difference(article.publishedAt).inDays}d'
                                : '${DateTime.now().difference(article.publishedAt).inHours}h',
                            content: article.content,
                            description: article.description ?? '',
                            categorylabel: state.category ?? 'All',
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('No Data'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
