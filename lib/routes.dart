import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:using_riverpod/src/content/quote_navigate.dart';
import 'package:using_riverpod/src/content/submit.dart';
import 'package:using_riverpod/src/content/video_navigate.dart';
import 'package:using_riverpod/src/my_web_page.dart';

final GoRouter router = GoRouter(
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
        GoRoute(
          name: 'submitscreen',
          path: 'submitscreen',
          builder: (BuildContext context, GoRouterState state) {
            return const SubmitPage();
          },
        ),
      ],
    ),
  ],
);
