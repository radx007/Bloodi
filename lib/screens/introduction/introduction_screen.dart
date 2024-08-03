import 'package:bloodi/screens/auth/auth_choice_screen.dart';
import 'package:bloodi/widgets/intro/introduction_page.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final controller = PageController();
  bool isLastPage = false;
  int currentPageIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final EdgeInsets padding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 219, 219),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(         
            height: screenSize.height * .75  ,

            child: PageView.builder(
              controller: controller,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable user swipe
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 2;
                  currentPageIndex = index;
                });
              },
              itemCount: 3, // Total number of pages
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return const IntroductionPage(
                      imageUrl: 'assets/images/Blood-donation.png',
                      title: 'Easy Donor Search',
                      subTitle:
                          'Easy to find available donors nearby. Verified donors willing to help',
                    );
                  case 1:
                    return const IntroductionPage(
                      imageUrl: 'assets/images/Directions.png',
                      title: 'Track Your Donor',
                      subTitle:
                          'You can track tour donor\'s location and send them necessary informatioon to reach the destination properly ',
                    );
                  case 2:
                    return const IntroductionPage(
                      imageUrl: 'assets/images/Hospital.png',
                      title: 'Emergency Subscription',
                      subTitle:
                          'In case of emergency, you can find paid donors who are active 24/7',
                    );

                  default:
                    return Container(); // Placeholder for any additional pages
                }
              },
            ),
          ),
          isLastPage
              ? Container(
                  height: screenSize.height * .25  ,
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: SizedBox(
                      width: screenSize.width * .9,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const AuthChoiceScreen(),
                            ),
                          );
                        },
                        child: const Text('Get Started'),
                      ),
                    ),
                  ),
                )
              : Container(
                  height: screenSize.height * .25   ,
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                          backgroundColor:
                              const Color.fromARGB(255, 220, 219, 219),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: () => controller.jumpToPage(2),
                        child: const Text('Skip'),
                      ),
                      Center(
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: WormEffect(
                            activeDotColor: Theme.of(context).primaryColor,
                            dotWidth: 12,
                            dotHeight: 12,
                          ),
                          onDotClicked: (index) {
                            // Ensure only forward navigation
                            if (index > currentPageIndex) {
                              controller.animateToPage(index,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut);
                            }
                          },
                        ),
                      ),
                      FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: () {
                          if (currentPageIndex < 2) {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: const Icon(
                          Icons.arrow_right_alt_rounded,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
