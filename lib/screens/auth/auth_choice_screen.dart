import 'package:bloodi/screens/auth/auth_screen.dart';

import 'package:bloodi/widgets/intro/introduction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum AuthMode { signUp, logIn }

class AuthChoiceScreen extends StatelessWidget {
  const AuthChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final Size screenSize = MediaQuery.of(context).size;
    final EdgeInsets padding = MediaQuery.of(context).padding;
    return Scaffold(
      
      body: Scaffold(
        backgroundColor: const Color.fromARGB(255, 220, 219, 219),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: screenSize.height * .75 + padding.bottom + padding.top,
              padding: EdgeInsets.only(
                top: padding.top,
              ),
              child: const IntroductionPage(
                imageUrl: 'assets/images/Sign-in.png',
                title: "Welcome Bloodi:\nNearby City",
                subTitle:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting',
              ),
            ),
            Center(
              child: Container(
                height: screenSize.height * .2 - padding.bottom - padding.top,
                margin: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AuthScreen(authMode: AuthMode.signUp,),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AuthScreen(authMode: AuthMode.logIn,),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign In',
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
