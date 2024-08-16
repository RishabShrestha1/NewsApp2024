import 'package:go_router/go_router.dart';
import 'package:newsapp2024/screen/detailspage/presentation/screen/news_screen.dart';
import 'package:newsapp2024/screen/homepage/presentation/screen/home_screen.dart';

final route = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/details',
      name: 'details',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return DetailsScreen(
          title: extra['title'],
          source: extra['source'],
          time: extra['time'],
          imageUrl: extra['imageUrl'],
          content: extra['content'],
          description: extra['description'],
        );
      },
    ),
  ],
);
