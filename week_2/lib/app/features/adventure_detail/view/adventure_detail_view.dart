import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

import '../../../shared/models/adventure_item.dart';
import 'adventure_detail_appbar.dart';
import 'adventure_detail_body.dart';
import 'adventure_detail_bottom_navbar.dart';

class AdventureDetail extends StatefulWidget {
  const AdventureDetail({super.key, required this.item});
  final AdventureItem item;

  @override
  State<AdventureDetail> createState() => _AdventureDetailState();
}

class _AdventureDetailState extends State<AdventureDetail> with PositionFromTopBasedOnScroll {
  @override
  double get expandedHeight => 400;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const AdventureDetailBottomNavbar(),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          Theme(
            data: theme.copyWith(
              textTheme: theme.textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),
            ),
            child: AdventureDetailAppbar(
              expandedHeight: expandedHeight,
              item: widget.item,
              opacity: opacity,
            ),
          ),
          Theme(
            data: theme.copyWith(
              iconTheme: theme.iconTheme.copyWith(color: Colors.grey),
              textTheme: theme.textTheme.apply(bodyColor: Colors.grey, displayColor: Colors.grey),
            ),
            child: AdventureDetailBody(item: widget.item),
          ),

          /// So we can see the content under the bottom navbar
          const SliverToBoxAdapter(
            child: SizedBox(height: AdventureDetailBottomNavbar.height),
          ),
        ],
      ),
    );
  }
}
