import 'package:flutter/material.dart';

import '../core_shelf.dart';

extension ImagePathExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
  String get toGif => 'assets/gifs/loading.gif';
  String get toPng => 'assets/images/png/$this.png';

  AssetImage get pngLogoAsset => AssetImage('assets/logo/$this.png');
  AssetImage get pngIconAsset => AssetImage('assets/icon/$this.png');

  String get translate =>
      AppLocalizations.instance?.translateHelper(this) ?? this;
}
