import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';

import 'models/book.dart';
import 'services/books_service.dart';

final booksProvider = FutureProvider<List<Book>>((ref) => ref.watch(bookServiceProvider).all());

final palletFromNetworkImage = FutureProvider.family<PaletteGenerator, String>(
  (ref, url) => PaletteGenerator.fromImageProvider(NetworkImage(url)),
);
