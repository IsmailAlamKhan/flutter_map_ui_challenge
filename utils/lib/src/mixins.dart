import 'package:flutter/material.dart';

/// Couldn't find a good name 😅😅
/// but this is used to get positions from top to position widgets
/// as we scroll down.
mixin PositionFromTopBasedOnScroll<T extends StatefulWidget> on State<T> {
  final scrollController = ScrollController();

  /// this will give us the position of the widget from top
  final positionFromTop = ValueNotifier(0.0);

  /// this will give us opacity of a widget based on the scroll position
  final opacity = ValueNotifier(1.0);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      final top = _getPositionFromTop(context);
      positionFromTop.value = top;
      opacity.value = _getOpacity(top);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  double get expandedHeight;
  double _getPositionFromTop(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    var position = expandedHeight + paddingTop;
    const finalPosition = 0.0;

    if (scrollController.hasClients) {
      final offset = scrollController.offset;
      final isFinalPos = offset > position - finalPosition;
      if (isFinalPos) {
        position = finalPosition;
      } else {
        position = position - offset;
      }
    }
    return position;
  }

  double _getOpacity(double top) => (top / expandedHeight).clamp(0.0, 1.0);
}
