import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:utils/utils.dart';

import '../models/models.dart';

final adventureServiceProvider = Provider<AdventureService>(
  (_) => AssetAdventureServiceImpl(),
);

abstract class AdventureService {
  Future<List<AdventureItem>> getAll();
}

class AssetAdventureServiceImpl extends AdventureService {
  @override
  Future<List<AdventureItem>> getAll() async {
    final json = await rootBundle.loadString(assetPathBuilder('assets/json/travel.json'));
    return compute<String, List<AdventureItem>>(
      (json) {
        final decodedJson = jsonDecode(json) as List<dynamic>;
        return decodedJson.cast<Map<String, dynamic>>().map(AdventureItem.fromJson).toList();
      },
      json,
    );
  }
}
