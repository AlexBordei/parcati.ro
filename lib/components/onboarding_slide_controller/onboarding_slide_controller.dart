// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:parcati_ro/components/onboarding_slide_controller/onboarding_slide_controller_cubit.dart';

import '../../screens/onboarding_screen.dart';
import '../../slider/slider_navigator.dart';

class OnboardingSlideController extends StatelessWidget {
  late final int elementsNo;
  final List<Widget> sliderElements;
  VoidCallback onFinish;
  int activeElementIndex = 0;

  OnboardingSlideController({
    Key? key,
    required this.sliderElements,
    required this.onFinish,
  }) {
    elementsNo = sliderElements.length;

    for (var element in sliderElements) {
      updateSliderNavigator(element);
    }
  }

  bool updateSliderNavigator(Object widget) {
    if (widget is SliderNavigator) {
      widget.elementsNo = elementsNo;
      widget.activeElementIndex = activeElementIndex;
      return true;
    } else if (widget is SingleChildRenderObjectWidget) {
      if (widget.child != null) {
        updateSliderNavigator(widget.child as Widget);
      }
    } else if (widget is MultiChildRenderObjectWidget) {
      if (widget.children.isNotEmpty) {
        for (var element in widget.children) {
          updateSliderNavigator(element);
        }
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    activeElementIndex = context
        .watch<OnboardingSlideControllerCubit>()
        .state
        .activeElementIndex;

    for (var element in sliderElements) {
      updateSliderNavigator(element);
    }

    return Stack(children: [
      sliderElements[activeElementIndex],
      Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
            child: GestureDetector(
              onTap: () {
                if (activeElementIndex > 0) {
                  context.read<OnboardingSlideControllerCubit>().loadPrevious();
                }
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
            child: GestureDetector(
              onTap: () {
                if (activeElementIndex < elementsNo - 1) {
                  context.read<OnboardingSlideControllerCubit>().loadNext();
                } else {
                  onFinish();
                }
              },
            ),
          ),
        ],
      )
    ]);
  }
}
