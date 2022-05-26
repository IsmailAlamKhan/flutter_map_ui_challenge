import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../shared/models/book.dart';
import '../../book_details/view/book_details_view.dart';

class HomeViewBooks extends StatelessWidget {
  const HomeViewBooks(this.data, {super.key});
  final List<Book> data;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallDevice = constraints.maxWidth < 600;
        return CustomScrollView(
          slivers: [
            SliverCrossAxisConstrained(
              maxCrossAxisExtent: 800,
              child: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isSmallDevice ? 2 : 4,
                ),
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    final book = data[index];
                    return HomeViewBookItem(book: book);
                  },
                  childCount: data.length,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class HomeViewBookItem extends HookWidget {
  const HomeViewBookItem({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Hero(
        tag: 'Book-${book.id}',
        child: Card(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => BookDetailsView(book: book)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(child: Image.network(book.thumbnail)),
                  const SizedBox(height: 8),
                  Text(
                    book.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
