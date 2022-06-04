import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:utils/utils.dart';

import '../../../shared/models/book.dart';
import '../../book_details/view/book_details_view.dart';

class HomeViewBooks extends StatelessWidget {
  const HomeViewBooks({
    super.key,
    required this.data,
    required this.isSmallDevice,
  });
  final List<Book> data;
  final bool isSmallDevice;
  @override
  Widget build(BuildContext context) {
    return SliverCrossAxisConstrained(
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
    );
  }
}

class HomeViewBookItem extends HookWidget {
  const HomeViewBookItem({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 800),
      openBuilder: (_, __) => BookDetailsView(book: book),
      closedBuilder: (_, open) => Tooltip(
        message: book.title,
        child: Card(
          child: InkWell(
            onTap: open,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(book.thumbnail, errorBuilder: imageErrorWidgetBuilder),
                    // child: Placeholder(),
                  ),
                  const SizedBox(height: 8),
                  Text(book.language, style: Theme.of(context).textTheme.caption),
                  const SizedBox(height: 8),
                  Text(
                    book.title,
                    maxLines: 1,
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
