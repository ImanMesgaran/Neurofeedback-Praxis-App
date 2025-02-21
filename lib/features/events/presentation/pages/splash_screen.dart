import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neurofeedback_praxis_app/features/login/presentation/pages/sign_in_page.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(callback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF13202B), // Dark background
      body: Stack(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/splash_icon.png', // Replace with your actual image path
                width: 250, // Adjust size accordingly
              ),
            ),
          ),
        ],
      ),
    );
  }

  void callback(Duration _) async {
    await Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ));
      },
    );
  }
}
