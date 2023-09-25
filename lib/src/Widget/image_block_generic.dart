import 'package:flutter/material.dart';

class ImageBlock extends StatelessWidget {
  const ImageBlock({super.key, required this.arrayImage});
  final List arrayImage;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'SHIFT+scroll wheel',
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < arrayImage.length; i++)
              ImageCard(image: arrayImage[i])
          ]
          /* [
          ImageCard(
            image: arrayImage[0],
          ),
          ImageCard(
            image: arrayImage[1],
          ),
          ImageCard(
            image: arrayImage[2],
          ),
          ImageCard(
            image: arrayImage[3],
          ),
        ] */
          ,
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String image;

  const ImageCard({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        const SizedBox(width: 10),
        Container(
          height: 0.75 * height,
          width: width > 1000 ? 1000 : width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}
