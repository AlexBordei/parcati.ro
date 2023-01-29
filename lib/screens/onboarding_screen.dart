// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../components/onboarding_slide_controller/onboarding_slide_controller.dart';
import '../slider/slider_navigator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  List<Widget> sliderElements(BuildContext context) {
    return [
      renderSlide(
        title: 'Caută parcări în apropiere',
        description:
            'Găsești cu ușurință locuri de parcare în apropierea locației spre care mergi.',
        imageURL: 'assets/images/onboarding_1.png',
      ),
      renderSlide(
        title: 'Parchezi și plătești simplu',
        description: 'Simplu și ușor, parchezi și plătești în doar trei pași.',
        imageURL: 'assets/images/onboarding_2.png',
      ),
      renderSlide(
        title: 'Adaugă mai mult timp',
        description:
            'Oricând durata platită se apropie de final, poti extinde cu ușurință timpul rezervat.',
        imageURL: 'assets/images/onboarding_3.png',
      ),
    ];
  }

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
        child: OnboardingSlideController(
          sliderElements: sliderElements(context),
          onFinish: () {
            print('navigate to other screen');
          },
        ),
      )),
    );
  }
}

Widget renderSlide(
    {String title = '', String description = '', String imageURL = ''}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF192342),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: const TextStyle(
                color: Color(0xFF192342),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SliderNavigator(),
          ],
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Image.asset(
            imageURL,
            // width: MediaQuery.of(context).size.width * 90 / 100,
          ),
        ),
      ),
    ],
  );
}
