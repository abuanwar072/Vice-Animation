import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class StickySliverAppBar extends StatefulWidget {
  const StickySliverAppBar({
    this.sizePercent = 0,
    required this.indexNotifier,
    super.key,
  });

  final double sizePercent;
  final ValueNotifier<int> indexNotifier;

  @override
  State<StickySliverAppBar> createState() => _StickySliverAppBarState();
}

class _StickySliverAppBarState extends State<StickySliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: lerpDouble(152, 54, widget.sizePercent)!,
      leading: const SizedBox.shrink(),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 10 * widget.sizePercent,
      shadowColor: Colors.white60,
      pinned: true,
      actions: [
        Expanded(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) => Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.6, 1],
                  colors: [
                    Colors.white,
                    Colors.white10,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: FittedBox(
                      alignment: Alignment(-1 * (1 - widget.sizePercent), 0),
                      child: Text(
                        'ISSUE N',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 10,
                    child: FittedBox(
                      alignment: Alignment(-1 * (1 - widget.sizePercent), 0),
                      child: Stack(
                        children: [
                          Text(
                            '${index < 9 ? '0' : ''}${index + 1}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Positioned.fill(
                            child: Transform.rotate(
                              angle: -pi * .1,
                              child: const Divider(
                                color: Colors.black,
                                thickness: .3,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
