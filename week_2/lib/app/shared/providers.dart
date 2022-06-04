import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'services/services.dart';

final adventureProvider =
    FutureProvider.autoDispose((ref) => ref.read(adventureServiceProvider).getAll());
