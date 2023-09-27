import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod/src/content/quote_navigate.dart';
import 'package:using_riverpod/src/content/video_navigate.dart';
import 'package:using_riverpod/src/my_web_page.dart';
import 'package:using_riverpod/web_view_no_implementation.dart'
    if (dart.library.html) 'package:using_riverpod/web_view_implementation.dart';
import 'package:using_riverpod/routes.dart';

void main() {
  webViewImplementation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const MyWebPage();
      },
      routes: <RouteBase>[
        GoRoute(
          name: 'quote',
          path: 'quote',
          builder: (BuildContext context, GoRouterState state) {
            return const Quote();
          },
        ),
        GoRoute(
          name: 'videoScreen',
          path: 'videoscreen',
          builder: (BuildContext context, GoRouterState state) {
            return const VideoScreen();
          },
        ),
      ],
    ),
  ],
);
