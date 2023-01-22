import 'package:flutter/material.dart';

import '../components/onboarding_slide_controller/onboarding_slide_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(
        0xFFE5E5E5,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const Text('Caută parcări în apropiere'),
            const Text(
                'Găsești cu ușurință locuri de parcare în apropierea locației spre care mergi.'),
            OnboardingSlideController(
              elementsNo: 3,
            ),
            Image.asset('assets/images/onboarding_1.png'),
          ],
        ),
      )),
    );
  }
}
