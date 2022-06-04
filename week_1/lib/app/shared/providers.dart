import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/book.dart';
import 'services/books_service.dart';

final booksProvider = FutureProvider<List<Book>>((ref) => ref.watch(bookServiceProvider).all());
