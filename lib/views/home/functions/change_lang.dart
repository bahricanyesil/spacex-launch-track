import 'package:flutter/material.dart';

import '../../../core/core_shelf.dart';

Future<void> changeLang(BuildContext context, bool isTurkish) async {
  await Provider.of<LanguageProvider>(context, listen: false)
      .changeLanguage(isTurkish ? 'en' : 'tr');
}
