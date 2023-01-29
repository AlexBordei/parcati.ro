import 'package:flutter/material.dart';
import 'slider_position_marker.dart';

class SliderNavigator extends StatelessWidget {
  int elementsNo = 0;
  int activeElementIndex = 0;

  SliderNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: renderOnboardingSlideControllerElements(context),
    );
  }

  List<Widget> renderOnboardingSlideControllerElements(BuildContext context) {
    List<Widget> result = [];

    for (int i = 0; i < elementsNo; i++) {
      result.add(
        InkWell(
          onTap: () {},
          child: SliderPositionMarker(
            isFirst: i == 0,
            isActive: i == activeElementIndex,
          ),
        ),
      );
    }
    return result;
  }
}
