import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../helper.dart';
import '../../shared/tab_destination.dart';

class RootView extends HookWidget {
  const RootView({
    super.key,
    required this.currentIndex,
    required this.child,
  });
  final int currentIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(this.currentIndex);

    useEffect(() {
      currentIndex.value = this.currentIndex;
    }, [this.currentIndex]);

    void onTap(int index) {
      currentIndex.value = index;
      final route = tabs[index];
      context.go(route.path);
    }

    Widget child = AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => FadeThroughTransition(
        animation: animation,
        secondaryAnimation: ReverseAnimation(animation),
        fillColor: Colors.transparent,
        child: child,
      ),
      child: this.child,
    );
    if (isSmallScreen(context)) {
      return RootViewMobile(
        currentIndex: currentIndex.value,
        onTabChanged: onTap,
        child: child,
      );
    } else {
      return RootViewDesktopAndTab(
        currentIndex: currentIndex.value,
        onTabChanged: onTap,
        child: child,
      );
    }
  }
}

class RootViewMobile extends StatelessWidget {
  const RootViewMobile({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onTabChanged,
  });
  final Widget child;
  final int currentIndex;
  final ValueChanged<int> onTabChanged;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onTabChanged,
        destinations: tabs
            .map((tab) => NavigationDestination(
                  icon: tab.icon,
                  label: tab.label,
                ))
            .toList(),
      ),
      body: child,
    );
  }
}

class RootViewDesktopAndTab extends StatelessWidget {
  const RootViewDesktopAndTab({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onTabChanged,
  });
  final Widget child;
  final int currentIndex;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: !isTablet(context),
            destinations: tabs
                .map((tab) => NavigationRailDestination(
                      icon: tab.icon,
                      label: Text(tab.label),
                    ))
                .toList(),
            selectedIndex: currentIndex,
            onDestinationSelected: onTabChanged,
          ),
          const VerticalDivider(),
          Expanded(child: child)
        ],
      ),
    );
  }
}
