import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/link.dart';

import '../../../shared/models/book.dart';
import '../../../shared/widgets/widgets.dart';

class BookDetailsView extends ConsumerWidget {
  const BookDetailsView({
    super.key,
    required this.book,
  });
  final Book book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.2,
              title: Tooltip(
                message: book.title,
                child: Text(
                  book.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              background: Image.network(book.thumbnail, fit: BoxFit.cover),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  if (book.authors != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Authors',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: book.authors!.map((author) {
                            return Chip(label: Text(author));
                          }).toList(),
                        ),
                      ],
                    ),
                  const SizedBox(height: 8),
                  if (book.description != null)
                    SelectableText(
                      book.description!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Link(
                      uri: Uri.parse(book.previewLink),
                      builder: (_, launch) {
                        return FilledButton(
                          onPressed: launch,
                          child: Text(
                            'Preview',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
