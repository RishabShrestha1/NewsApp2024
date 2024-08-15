import 'package:go_router/go_router.dart';
import 'package:newsapp2024/screen/detailspage/presentation/screen/newspage.dart';
import 'package:newsapp2024/screen/homepage/presentation/screen/homepage.dart';

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
        builder: (context, state) => DetailsScreen()),
  ],
);
