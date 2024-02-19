import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../widgets/content_magazines_page_view.dart';
import '../widgets/heart_and_save_button.dart';
import '../widgets/sticky_sliver_app_bar.dart';

class MagazinesDetailsScreen extends StatefulWidget {
  const MagazinesDetailsScreen({
    required this.index,
    required this.magazines,
    super.key,
  });

  final int index;
  final List<Magazine> magazines;

  static void push(
    BuildContext context, {
    required int index,
    required List<Magazine> magazines,
  }) =>
      Navigator.push<int>(
        context,
        PageRouteBuilder(
          pageBuilder: (_, animation, __) => FadeTransition(
            opacity: animation,
            child: MagazinesDetailsScreen(
              index: index,
              magazines: magazines,
            ),
          ),
        ),
      );

  @override
  State<MagazinesDetailsScreen> createState() => _MagazinesDetailsScreenState();
}

class _MagazinesDetailsScreenState extends State<MagazinesDetailsScreen> {
  late final ScrollController scrollController;
  late ValueNotifier<int> indexNotifier;
  double headerPercent = 0;

  @override
  void initState() {
    scrollController = ScrollController();
    indexNotifier = ValueNotifier(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            slivers: [
              // TODO: Cube 3D PageView
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: Center(
                    child: Text(
                      "TODO: Cube 3D PageView",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
              StickySliverAppBar(indexNotifier: indexNotifier),
              SliverToBoxAdapter(
                child: ContentMagazinesPageView(
                  indexNotifier: indexNotifier,
                  magazines: widget.magazines,
                ),
              ),
            ],
          ),
          HeartAndSaveButtons(),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  color: Color.lerp(
                    Colors.white60,
                    Colors.black,
                    headerPercent,
                  ),
                  onPressed: () {},
                  icon: const Icon(ViceIcons.close),
                ),
                MenuButton(
                  color: Color.lerp(
                    Colors.white60,
                    Colors.black,
                    headerPercent,
                  )!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
