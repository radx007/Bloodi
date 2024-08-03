import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroductionPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;

  const IntroductionPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final EdgeInsets padding = MediaQuery.of(context).padding;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(60)),
              ),
              
              height: screenSize.height * .5 - padding.bottom - padding.top,
            ),
            SizedBox(
              width: screenSize.width,
              height: screenSize.height * .5 - padding.bottom - padding.top,
              child: SvgPicture.asset(imageUrl),
            ),
          ],
        ),
        Stack(children: [
          Container(
            width: screenSize.width,
            height: screenSize.height * .3 - padding.bottom - padding.top,
            color: Colors.white,
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: screenSize.width,
            height: screenSize.height * .3 - padding.bottom - padding.top,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 220, 219, 219),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ])
      ],
    );
  }
}
