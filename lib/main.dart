import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod/src/content/page_to_navigate.dart';
import 'package:using_riverpod/web_view_no_implementation.dart'
    if (dart.library.html) 'package:using_riverpod/web_view_implementation.dart';

void main() {
  webViewImplementation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Quote(),
      ),
    );
  }
}
