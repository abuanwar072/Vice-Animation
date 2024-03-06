import 'package:flutter/material.dart';

enum SlideDirection { left, right }

class DragableWidget extends StatefulWidget {
  const DragableWidget(
      {super.key,
      required this.child,
      this.onSlideOut,
      this.onPressed,
      required this.isEnableDrag});

  final Widget child;
  final ValueChanged<SlideDirection>? onSlideOut;
  final VoidCallback? onPressed;
  final bool isEnableDrag;

  @override
  State<DragableWidget> createState() => _DragableWidgetState();
}

class _DragableWidgetState extends State<DragableWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.child,
    );
  }
}
