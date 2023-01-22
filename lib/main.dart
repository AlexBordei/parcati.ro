import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parcati_ro/components/onboarding_slide_controller/onboarding_slide_controller_cubit.dart';
import 'package:parcati_ro/screens/onboarding_screen.dart';
import 'package:parcati_ro/screens/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (_) => OnboardingSlideControllerCubit(),
      child: const OnboardingScreen(),
    ),
  ));
}
