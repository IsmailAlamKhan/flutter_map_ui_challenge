import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:utils/utils.dart';

import '../models/book.dart';

final bookServiceProvider = Provider<BookService>(
  (_) => AssetBookServiceImpl(),
);

abstract class BookService {
  Future<List<Book>> all();
}

class AssetBookServiceImpl implements BookService {
  @override
  Future<List<Book>> all() async {
    try {
      final jsonString = await rootBundle.loadString(assetPathBuilder('assets/json/books.json'));
      final json = jsonDecode(jsonString);
      final books = (json as List).cast<Map<String, dynamic>>().map(Book.fromJson).toList();
      return books;
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }
}
