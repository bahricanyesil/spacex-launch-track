import 'package:flutter/material.dart';
import '../core_shelf.dart';

mixin TextFormDeco {
  static InputDecoration loginDeco(
      BuildContext context, String hintText, Widget prefixIcon,
      [Widget? suffixIcon]) {
    return InputDecoration(
      errorMaxLines: 1,
      prefixIconConstraints: context.iconBoxConstraints,
      suffixIconConstraints: context.iconBoxConstraints,
      enabledBorder: OutlineInputBorder(
        borderSide: context.defaultBlack,
        borderRadius: context.mediumCircular,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: context.defaultPrimary,
        borderRadius: context.mediumCircular,
      ),
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  static InputDecoration mainCardText(
      BuildContext context, String labelText) {
    return InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        labelStyle: context.headline3,
        labelText: labelText);
  }
}
