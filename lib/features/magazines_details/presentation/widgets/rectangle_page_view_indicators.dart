import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class RectanglePageViewIndicators extends StatelessWidget {
  const RectanglePageViewIndicators({
    required this.percent,
    required this.indexNotifier,
    required this.length,
    super.key,
  });

  final double percent;
  final ValueNotifier<int> indexNotifier;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: null,
      bottom: lerpDouble(.05 * MediaQuery.of(context).size.height,
          -ViceUIConsts.headerHeight(context), percent),
      child: ValueListenableBuilder<int>(
        valueListenable: indexNotifier,
        builder: (__, value, _) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
            length,
            (index) {
              final isSelected = index == value;
              return AnimatedContainer(
                duration: kThemeAnimationDuration,
                margin:
                    index != (length - 1) ? EdgeInsets.only(right: 4) : null,
                height: isSelected ? 6 : 4,
                width: isSelected ? 12 : 8,
                color: isSelected ? Colors.white : Colors.white38,
              );
            },
          ),
        ),
      ),
    );
  }
}
