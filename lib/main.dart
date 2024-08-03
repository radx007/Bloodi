import 'package:bloodi/screens/introduction/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloodi',
      theme: ThemeData(
        primaryColor: const Color(0xFFE60449),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.black,
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 25.0,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
            color: Color(0xFFE60449),
          ),
          bodySmall: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w400,
            fontSize: 15.0,
            color: Color.fromARGB(255, 148, 148, 148),
          ),
          titleMedium: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 15.0,
            color: Colors.black,
          ),
          
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFE60449),
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE60449),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFFE60449),
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        colorScheme: const ColorScheme(
          primary: Color(0xFFE60449),
          secondary: Color(0xFFDEDEDE),
          surface: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onError: Colors.white,
          brightness: Brightness.dark,
        ).copyWith(
          primary: Color(0xFFE60449),
          secondary: const Color(0xFFDEDEDE),
        ),
      ),
      home: IntroductionScreen(),
    );
  }
}
