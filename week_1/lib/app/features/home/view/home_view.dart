import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/providers.dart';
import 'home_view_books.dart';
import 'home_view_error.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksData = ref.watch(booksProvider);
    return LayoutBuilder(builder: (context, constraints) {
      final isSmallDevice = constraints.maxWidth < 600;
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Books'),
              floating: isSmallDevice,
              pinned: !isSmallDevice,
            ),
            booksData.when(
              data: (data) => HomeViewBooks(data: data, isSmallDevice: isSmallDevice),
              error: (error, stackTrace) => SliverFillRemaining(
                child: HomeViewError(error: error),
              ),
              loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      );
    });
  }
}
