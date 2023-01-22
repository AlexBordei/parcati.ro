import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFE5E5E5,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.topRight,
                child: FractionallySizedBox(
                  heightFactor: 0.7,
                  child: Image.asset(
                    'assets/images/splash_side.png',
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 2,
              child: Text(
                'Parcați.ro',
                style: TextStyle(
                  color: Color(0xFF192342),
                  fontSize: 48,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/images/splash_bottom.png',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
