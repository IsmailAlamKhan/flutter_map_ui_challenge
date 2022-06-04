import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:palette_generator/palette_generator.dart';

Future<PaletteGenerator> getColorFromImage(ImageProvider<Object> image) async {
  final imageProvider = ResizeImage(image, height: 50, width: 50);
  final stream = imageProvider.resolve(const ImageConfiguration(devicePixelRatio: 1.0));
  final Completer<ui.Image> imageCompleter = Completer<ui.Image>();
  late ImageStreamListener listener;
  listener = ImageStreamListener((ImageInfo info, bool synchronousCall) {
    stream.removeListener(listener);
    imageCompleter.complete(info.image);
  });

  stream.addListener(listener);
  final ui.Image _image = await imageCompleter.future;
  final byteData = await _image.toByteData();
  if (byteData == null) {
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary('Image is null'),
      ErrorDescription('Image is null'),
      ErrorHint('Image is null'),
    ]);
  }
  final encodedImage = EncodedImage(byteData, height: _image.height, width: _image.width);

  return compute<EncodedImage, PaletteGenerator>(
    (encodedImage) => PaletteGenerator.fromByteData(encodedImage),
    encodedImage,
  );
}

String assetPathBuilder(String assetName) => 'packages/utils/$assetName';
