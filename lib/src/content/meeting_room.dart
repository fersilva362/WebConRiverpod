import 'package:flutter/material.dart';
import 'package:using_riverpod/src/Widget/text_block_generic.dart';
import 'package:using_riverpod/src/Widget/image_block_generic.dart';
import 'package:using_riverpod/src/Widget/responsive_widget.dart';

List imageMeeting = [
  'assets/conferenceRoomA.png',
  'assets/conferenceRoomBandC.png',
  'assets/conferenceRoomD.png',
  'assets/conferenceRoomE.png'
];

class MeetingRoom extends ResponsiveWidget {
  const MeetingRoom({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return const DesktopMeetingRoom();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const MobileMeetingRoom();
  }
}

class DesktopMeetingRoom extends StatelessWidget {
  const DesktopMeetingRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: const Color.fromRGBO(247, 247, 247, 1),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextBlockGeneric(
            width: 0.3 * width,
            height: height,
            headline: 'NYC',
            title: 'Meeting Rooms',
            subtitle: 'Conference & Collaborative Team Rooms',
            text:
                'Workville offers a variety Meeting Spaces for teams of all sizes. From Private offices, Conference Rooms and our all-new " War Room", We will find the right solution for your needs.',
          ),
          Expanded(
              child: ImageBlock(
            arrayImage: imageMeeting,
          ))
        ],
      ),
    );
  }
}

class MobileMeetingRoom extends StatelessWidget {
  const MobileMeetingRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      color: const Color.fromRGBO(247, 247, 247, 1),
      child: Column(
        children: [
          TextBlockGeneric(
            width: width,
            height: 0.2 * height,
            headline: 'NYC',
            title: 'Meeting Rooms',
            subtitle: 'Conference & Collaborative Team Rooms',
            text:
                'Workville offers a variety Meeting Spaces for teams of all sizes. From Private offices, Conference Rooms and our all-new " War Room", We will find the right solution for your needs.',
          ),
          Expanded(
              child: ImageBlock(
            arrayImage: imageMeeting,
          ))
        ],
      ),
    );
  }
}
