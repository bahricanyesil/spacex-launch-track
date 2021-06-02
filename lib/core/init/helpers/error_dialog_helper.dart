import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core_shelf.dart';

bool errorDialogHelper(provider, BuildContext context, [bool? shouldPop]) {
  if (provider.errorMessage == '') {
    return true;
  } else {
    if (shouldPop != null && shouldPop) Navigator.of(context).pop();
    CustomDialog(
      content: Text(
        provider.errorMessage,
        style: context.headline6.copyWith(color: Colors.black87),
        textAlign: TextAlign.center,
      ),
      rightButtonText: 'ok'.translate,
    ).show(context);
    provider.errorMessage = '';
    return false;
  }
}
