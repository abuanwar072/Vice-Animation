import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vice_app/core/shared/domain/entities/magazine.dart';
import 'package:vice_app/core/shared/presentation/widgets/magazine_cover_image.dart';
import 'package:vice_app/features/home/presentation/widgets/dragable_widget.dart';

class InfiniteDragableSlider extends StatefulWidget {
  const InfiniteDragableSlider({
    super.key,
    required this.itemBuilder,
    required this.iteamCount,
    this.index = 0,
  });

  final Function(BuildContext context, int index) itemBuilder;
  final int iteamCount;
  final int index;

  @override
  State<InfiniteDragableSlider> createState() => _InfiniteDragableSliderState();
}

class _InfiniteDragableSliderState extends State<InfiniteDragableSlider> {
  final double defaultAngle18Dgree = pi * 0.1;
  Offset getOffser(int stackIndex) {
    return {
          0: Offset(0, 30),
          1: Offset(-70, 30),
          2: Offset(70, 30),
        }[stackIndex] ??
        Offset(0, 0);
  }

  double getAngle(int stackIndex) =>
      {
        0: 0.0,
        1: -defaultAngle18Dgree,
        2: defaultAngle18Dgree,
      }[stackIndex] ??
      0.0;

  double getScal(int stackIndex) =>
      {
        0: 0.6,
        1: 0.9,
        2: 0.95,
      }[stackIndex] ??
      1.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        4,
        (stackIndex) {
          return Transform.translate(
            offset: getOffser(stackIndex),
            child: Transform.scale(
              scale: getScal(stackIndex),
              child: Transform.rotate(
                angle: getAngle(stackIndex),
                child: DragableWidget(
                  isEnableDrag: stackIndex == 3,
                  child: widget.itemBuilder(context, stackIndex),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
