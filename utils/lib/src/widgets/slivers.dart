import 'dart:math' as math;

import 'package:flutter/material.dart';

int _computeChildCount(int childCount) => math.max(0, childCount * 2 - 1);
int _kDefaultSemanticIndexCallback(Widget _, int localIndex) => localIndex;

class SliverSeparatedBuilderDelegate extends SliverChildBuilderDelegate {
  SliverSeparatedBuilderDelegate(
    IndexedWidgetBuilder itemBuilder,
    IndexedWidgetBuilder separatorBuilder, {
    required int childCount,
    ChildIndexGetter? findChildIndexCallback,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    SemanticIndexCallback semanticIndexCallback = _kDefaultSemanticIndexCallback,
    int semanticIndexOffset = 0,
  }) : super(
          (BuildContext context, int index) {
            final int itemIndex = index ~/ 2;
            final Widget widget;
            if (index.isEven) {
              widget = itemBuilder(context, itemIndex);
            } else {
              widget = separatorBuilder(context, itemIndex);
            }
            return widget;
          },
          childCount: _computeChildCount(childCount),
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          findChildIndexCallback: findChildIndexCallback,
          semanticIndexCallback: semanticIndexCallback,
          semanticIndexOffset: semanticIndexOffset,
        );
}

class PersistentHeader extends StatelessWidget {
  const PersistentHeader({
    super.key,
    this.pinned = false,
    this.floating = false,
    this.collapsedHeight,
    required this.child,
  });
  final bool pinned;
  final bool floating;
  final double? collapsedHeight;
  final PreferredSizeWidget child;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _PersistentHeader(
        pinned: pinned,
        floating: floating,
        collapsedHeight: collapsedHeight,
        child: child,
      ),
      pinned: pinned,
      floating: floating,
    );
  }
}

class _PersistentHeader extends SliverPersistentHeaderDelegate {
  final bool pinned;
  final bool floating;
  final double? collapsedHeight;
  final PreferredSizeWidget child;
  _PersistentHeader({
    required this.pinned,
    required this.floating,
    required this.collapsedHeight,
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final isScrolledUnder =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()?.isScrolledUnder ??
            (overlapsContent || (pinned && shrinkOffset > maxExtent - minExtent));

    return FlexibleSpaceBar.createSettings(
      currentExtent: math.max(minExtent, maxExtent - shrinkOffset),
      isScrolledUnder: isScrolledUnder,
      minExtent: minExtent,
      maxExtent: maxExtent,
      child: child,
    );
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => pinned ? child.preferredSize.height : (collapsedHeight ?? 0);

  @override
  bool shouldRebuild(_PersistentHeader oldDelegate) =>
      oldDelegate.floating != floating ||
      oldDelegate.pinned != pinned ||
      oldDelegate.collapsedHeight != collapsedHeight ||
      oldDelegate.child != child;
}
