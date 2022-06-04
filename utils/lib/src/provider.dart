import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';

import 'global_methods.dart';

final palletFromNetworkImage = FutureProvider.family<PaletteGenerator, ImageProvider>(
  (ref, image) => getColorFromImage(image),
);
