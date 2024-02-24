import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vice_app/core/shared/domain/entities/magazine.dart';
import 'package:vice_app/core/shared/presentation/widgets/magazine_cover_image.dart';

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
  Offset getOffser(int stackIndex) {
    return {
          0: Offset(0, 30),
          1: Offset(-70, 30),
          2: Offset(70, 30),
        }[stackIndex] ??
        Offset(0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        4,
        (stackIndex) {
          return Transform.translate(
            offset: getOffser(stackIndex),
            child: Transform.scale(
              scale: 0.6,
              child: Transform.rotate(
                angle: -pi * 0.1, // 18 degree
                child: widget.itemBuilder(context, stackIndex),
              ),
            ),
          );
        },
      ),
    );
  }
}
