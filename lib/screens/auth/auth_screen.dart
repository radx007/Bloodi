import 'package:bloodi/screens/auth/auth_choice_screen.dart';
import 'package:bloodi/widgets/Auth/sign_in.dart';
import 'package:bloodi/widgets/Auth/sign_up.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final AuthMode authMode;
  const AuthScreen({super.key, required this.authMode});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            primary: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      widget.authMode == AuthMode.signUp
                          ? Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Sign Up Your Account',
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.left,
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                'Sign In Your Account',
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.left,
                              ),
                            ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting Lorem Ipsum is text',
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      widget.authMode == AuthMode.logIn ? const SignIn() : const SignUp(),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 0,
                          bottom: 15,
                          right: 15,
                          left: 15,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Or',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.0,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 232, 232, 232),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                            ),
                            onPressed: () {},
                            child: const Icon(
                              Icons.email,
                              color: Color.fromARGB(255, 11, 180, 104),
                            ),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 232, 232, 232),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                            ),
                            onPressed: () {},
                            child: const Icon(
                              Icons.facebook,
                              color: Color.fromARGB(255, 1, 94, 171),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widget.authMode == AuthMode.signUp
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already Have An Account?',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 0,
                                      vertical: 0,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const AuthScreen(
                                          authMode: AuthMode.logIn,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text('Sign In'),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t Have An Account?',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 0,
                                      vertical: 0,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const AuthScreen(
                                          authMode: AuthMode.signUp,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Sign Up',
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
