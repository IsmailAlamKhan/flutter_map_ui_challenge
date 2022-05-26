import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/providers.dart';
import '../../../shared/widgets/widgets.dart';

class HomeViewError extends ConsumerWidget {
  const HomeViewError({super.key, required this.error});
  final Object error;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error.toString()),
          FilledButton(
            child: const Text('Retry'),
            onPressed: () {
              ref.refresh(booksProvider);
            },
          ),
        ],
      ),
    );
  }
}
