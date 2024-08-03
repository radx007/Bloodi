import 'package:bloodi/screens/home_screen.dart';
import 'package:bloodi/widgets/Auth/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _emailController = TextEditingController();

  final _passWordController = TextEditingController();

  final Map<String, String?> _authData = {
    'email': '',
    'password': '',
  };

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextField(
              hintText: 'Email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              suffixIcon: Icon(
                Icons.email,
                color: Theme.of(context).primaryColor,
              ),
            ),
            CustomTextField(
              hintText: 'Password',
              controller: _passWordController,
              keyboardType: TextInputType.text,
              isObscureText: true,
              suffixIcon: Icon(
                Icons.password,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (_) {
                        setState(() {
                          rememberMe = !rememberMe;
                        });
                      },
                    ),
                    Text(
                      'Remember Me',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 0,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password',
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _authData['email'] = _emailController.text.trim();
                _authData['password'] = _passWordController.text.trim();
                if (_authData['email'] == 'admin' &&
                    _authData['password'] == 'admin' &&
                    rememberMe == true) {
                  print('You SIGNED IN');
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (Route<dynamic> route) => false,
                  );
                } else {
                  print('rejected');
                }
              },
              child: const Text(
                'Sign IN',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
