import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:utils/utils.dart';

import '../../../shared/models/models.dart';
import '../../../shared/providers.dart';
import '../../adventure_detail/view/adventure_detail_view.dart';

class AdventureList extends ConsumerWidget {
  const AdventureList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adventureData = ref.watch(adventureProvider);
    return AsyncValueBuilder<List<AdventureItem>>.sliver(
      value: adventureData,
      builder: (_, data) {
        return SliverList(
          delegate: SliverSeparatedBuilderDelegate(
            childCount: data.length,
            (_, index) {
              final item = data[index];
              final scrollable = Scrollable.of(context);
              return OpenContainer(
                closedColor: Colors.transparent,
                openBuilder: (_, __) => AdventureDetail(item: item),
                closedBuilder: (_, __) => AdventureTile(item: item, scrollable: scrollable!),
              );
            },
            (_, __) => const SizedBox(height: 16),
          ),
        );
      },
    );
  }
}

class AdventureTile extends StatelessWidget {
  const AdventureTile({super.key, required this.item, required this.scrollable});

  final AdventureItem item;
  final ScrollableState scrollable;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Card(
        margin: EdgeInsets.zero,
        child: Stack(
          children: [
            ParalaxImage(
              scrollable: scrollable,
              image: AssetImage('assets/images/${item.image}', package: 'utils'),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Material(
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          text: '${item.name}, ',
                          children: [
                            TextSpan(
                              text: item.location,
                              style: const TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
