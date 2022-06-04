import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

import '../../../shared/models/adventure_item.dart';
import '../../../shared/widgets/widgets.dart';

class AdventureDetailAppbar extends StatelessWidget {
  const AdventureDetailAppbar({
    super.key,
    required this.expandedHeight,
    required this.opacity,
    required this.item,
  });

  final double expandedHeight;
  final ValueNotifier<double> opacity;
  final AdventureItem item;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    );
    return SliverAppBar(
      expandedHeight: expandedHeight,
      shape: const RoundedRectangleBorder(borderRadius: borderRadius),
      pinned: true,
      leading: Center(
        child: Material(
          shape: const CircleBorder(),
          color: Colors.black.withOpacity(.5),
          child: IconButton(
            onPressed: Navigator.of(context).maybePop,
            color: Colors.white,
            icon: const BackButtonIcon(),
            constraints: const BoxConstraints(),
          ),
        ),
      ),
      flexibleSpace: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            FlexibleSpaceBar(
              background: Image.asset(
                item.imageUrl,
                package: 'utils',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ValueListenableBuilder<double>(
                valueListenable: opacity,
                builder: (_, opacity, child) => Opacity(opacity: opacity, child: child),
                child: _Details(item: item),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({super.key, required this.item});

  final AdventureItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black.withAlpha(200), Colors.black.withAlpha(10)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('999', style: textTheme.bodySmall),
            const SizedBox(height: 8),
            Text(
              item.title,
              style: textTheme.headline6!.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 48,
              child: Row(
                children: [
                  Flexible(
                    child: Stack(
                      children:
                          ['https://i.pravatar.cc/150?img=36', 'https://i.pravatar.cc/150?img=19']
                              .indexedMap(
                                (index, item) => Positioned(
                                  left: index * 18,
                                  child: Avatar(image: NetworkImage(item)),
                                ),
                              )
                              .toList(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text('Sofie, Lauren + 13 more', style: textTheme.labelSmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
