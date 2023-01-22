// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parcati_ro/components/onboarding_slide_controller/onboarding_slide_controller_cubit.dart';

class OnboardingSlideController extends StatelessWidget {
  int elementsNo;
  int activeElementIndex;

  OnboardingSlideController({
    Key? key,
    this.elementsNo = 0,
    this.activeElementIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    activeElementIndex = context
        .watch<OnboardingSlideControllerCubit>()
        .state
        .activeElementIndex;
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Row(children: renderOnboardingSlideControllerElements(context)),
    );
  }

  List<Widget> renderOnboardingSlideControllerElements(BuildContext context) {
    List<Widget> result = [];

    for (int i = 0; i < elementsNo; i++) {
      result.add(
        InkWell(
          onTap: () {
            context.read<OnboardingSlideControllerCubit>().loadElement(i);
          },
          child: OnboardingSlideControllerElement(
            isFirst: i == 0,
            isActive: i == activeElementIndex,
          ),
        ),
      );
    }
    return result;
  }
}

class OnboardingSlideControllerElement extends StatelessWidget {
  final bool isActive;
  final bool isFirst;

  const OnboardingSlideControllerElement({
    Key? key,
    this.isActive = false,
    this.isFirst = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: !isFirst ? const EdgeInsets.only(left: 5) : EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFF567DF4).withOpacity(
          isActive ? 1 : 0.25,
        ),
      ),
      width: isActive ? 30 : 10,
      height: 10,
    );
  }
}
