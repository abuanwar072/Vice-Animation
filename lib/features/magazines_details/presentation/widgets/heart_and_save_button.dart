import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class HeartAndSaveButtons extends StatelessWidget {
  const HeartAndSaveButtons({
    this.movePercent = 0,
    super.key,
  });

  final double movePercent;

  @override
  Widget build(BuildContext context) {
    final double height = 48;
    final double width = 48;
    final bottom =
        MediaQuery.of(context).size.height - ViceUIConsts.headerHeight(context);
    return Positioned(
      bottom: ui.lerpDouble(bottom - height, height, movePercent),
      right: 24,
      child: Column(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: ColoredBox(
              color: Colors.black,
              child: FittedBox(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(ViceIcons.heart, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height,
            width: width,
            child: ColoredBox(
              color: Colors.green.shade500,
              child: FittedBox(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(ViceIcons.save, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
