import 'package:flutter/material.dart';

class SliderPositionMarker extends StatelessWidget {
  final bool isActive;
  final bool isFirst;

  const SliderPositionMarker({
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
