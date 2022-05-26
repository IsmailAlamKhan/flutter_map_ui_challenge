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
    return Scaffold(
      appBar: AppBar(title: const Text('Books')),
      body: booksData.when(
        data: HomeViewBooks.new,
        error: (error, stackTrace) => HomeViewError(error: error),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
