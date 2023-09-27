import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:using_riverpod/src/content/about_us.dart';
import 'package:using_riverpod/src/content/contact_us.dart';
import 'package:using_riverpod/src/content/coworking_space.dart';
import 'package:using_riverpod/src/content/mamber.dart';
import 'package:using_riverpod/src/content/meeting_room.dart';
import 'package:using_riverpod/src/content/oasis.dart';
import 'package:using_riverpod/src/navbar/navbar.dart';

final keyAboutUs = GlobalKey();
final keyCoworkingKey = GlobalKey();
final keyOASIS = GlobalKey();
final keyMeeting = GlobalKey();
final keyMember = GlobalKey();
final keyContact = GlobalKey();

final scrollProvider = StateProvider<bool>((ref) => false);
final currentPageProvider = StateProvider<GlobalKey>((_) => keyAboutUs);

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
    useEffect(() {
      _controller.addListener(() {
        onScroll(_controller, ref);
      });
      return _controller.dispose;
    }, [_controller]);

    ref
        .watch(currentPageProvider.notifier)
        .addListener(scrollTo, fireImmediately: false);
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          width: (maxWidth > 1200) ? 1200 : maxWidth,
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              const NavBar(),
              Expanded(
                child: SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                    children: [
                      AboutUs(key: keyAboutUs),
                      CoworkingSpace(key: keyCoworkingKey),
                      Oasis(key: keyOASIS),
                      MeetingRoom(key: keyMeeting),
                      MemeberCoworker(key: keyMember),
                      ContactContent(
                        key: keyContact,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
