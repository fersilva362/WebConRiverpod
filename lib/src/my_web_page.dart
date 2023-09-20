import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod/src/content/contact_content.dart';
import 'package:using_riverpod/src/content/feature_content.dart';
import 'package:using_riverpod/src/content/home_content.dart';
import 'package:using_riverpod/src/content/screenshot_content.dart';
import 'package:using_riverpod/src/navbar/navbar.dart';
import 'dart:developer' as devtools show log;

final keyHome = GlobalKey();
final keyFeature = GlobalKey();
final keyScreenShot = GlobalKey();
final keyContact = GlobalKey();
final scrollProvider = StateProvider<bool>((ref) => false);
final currentPageProvider = StateProvider<GlobalKey>((_) => keyHome);

class MyWebPage extends HookConsumerWidget {
  const MyWebPage({super.key});

  void onScroll(ScrollController controller, WidgetRef ref) {
    final isScroll = ref.read(scrollProvider.notifier).state;

    if (controller.position.pixels > 5 && !isScroll) {
      ref.read(scrollProvider.notifier).state = true;
    } else if (controller.position.pixels <= 5 && isScroll) {
      ref.read(scrollProvider.notifier).state = false;
    }
  }

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _controller = useScrollController();
    devtools.log(ref.watch(scrollProvider.notifier).state.toString());
    useEffect(() {
      _controller.addListener(() {
        onScroll(_controller, ref);
      });
      return _controller.dispose;
    }, [_controller]);
    final maxWidth = MediaQuery.of(context).size.width;

    ref
        .watch(currentPageProvider.notifier)
        .addListener(scrollTo, fireImmediately: false);

    return Scaffold(
      body: Center(
        child: Container(
          width: (maxWidth > 1200) ? 1200 : maxWidth,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
            ),
          ),
          child: Column(
            children: [
              const NavBar(),
              Expanded(
                  child: SingleChildScrollView(
                controller: _controller,
                child: Column(
                  children: [
                    HomeContent(key: keyHome),
                    FeatureContent(
                      key: keyFeature,
                    ),
                    ScreenShotContent(
                      key: keyScreenShot,
                    ),
                    ContactContent(
                      key: keyContact,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
