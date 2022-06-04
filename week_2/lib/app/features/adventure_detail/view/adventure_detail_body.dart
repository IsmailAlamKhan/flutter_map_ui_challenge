import 'package:flutter/material.dart';

import '../../../shared/models/adventure_item.dart';
import 'adventure_detail_info_section.dart';

class AdventureDetailBody extends StatelessWidget {
  const AdventureDetailBody({super.key, required this.item});

  final AdventureItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            const AdventureDetailInfoSection(),
            Text(item.description, style: theme.textTheme.caption)
          ],
        ),
      ),
    );
  }
}
