import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class ContentMagazinesPageView extends StatefulWidget {
  const ContentMagazinesPageView({
    required this.indexNotifier,
    required this.magazines,
    super.key,
  });

  final ValueNotifier<int> indexNotifier;
  final List<Magazine> magazines;

  @override
  State<ContentMagazinesPageView> createState() =>
      _ContentMagazinesPageViewState();
}

class _ContentMagazinesPageViewState extends State<ContentMagazinesPageView> {
  late final PageController controller;
  Size? sizeWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeWidget?.height ?? MediaQuery.of(context).size.height,
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.magazines.length,
        itemBuilder: (_, index) {
          final magazine = widget.magazines[index];
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizeNotifierWidget(
              onSizeChange: (value) => setState(() => sizeWidget = value),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  for (int x = 0; x < 5; x++) ...[
                    Text(
                      'TITLE TEST ${magazine.id}',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(letterSpacing: 2),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        magazine.description,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(letterSpacing: 1),
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        magazine.description,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(letterSpacing: 1),
                      ),
                    ),
                    SizedBox(height: 12),
                    Image.asset(
                      magazine.assetImage,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 28),
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// {@template [SizeNotifierWidget]}
/// This widget notifies through its onSizeChanged method that when it is
/// executed send as parameter an object [Size] with the information of the
/// size of their child
/// {@endtemplate}
class SizeNotifierWidget extends StatefulWidget {
  /// {@macro [SizeNotifierWidget]}
  const SizeNotifierWidget({
    required this.child,
    required this.onSizeChange,
    super.key,
  });

  /// Child of the widget
  final Widget child;

  /// When change size
  final ValueChanged<Size> onSizeChange;

  @override
  State<SizeNotifierWidget> createState() => _SizeNotifierWidgetState();
}

class _SizeNotifierWidgetState extends State<SizeNotifierWidget> {
  final _widgetKey = GlobalKey();
  Size? _oldSize;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
        return true;
      },
      child: SizeChangedLayoutNotifier(
        child: SizedBox(
          key: _widgetKey,
          child: widget.child,
        ),
      ),
    );
  }

  void _notifySize() {
    final context = _widgetKey.currentContext;
    if (context == null) return;
    final size = context.size;
    if (_oldSize != size) {
      _oldSize = size;
      widget.onSizeChange(size!);
    }
  }
}
