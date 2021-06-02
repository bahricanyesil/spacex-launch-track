import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../../core_shelf.dart';
import 'sensitive_platform_dialog.dart';

class CustomDialog extends SensitivePlatformWidget {
  final Widget content;
  final Widget? title;
  final String rightButtonText;
  final String leftButtonText;
  final Function action;
  final provider;
  static void defaultFunc() {}

  CustomDialog(
      {required this.content,
      this.title,
      required this.rightButtonText,
      this.action = defaultFunc,
      this.provider = '',
      this.leftButtonText = ''});

  Future<void> show(BuildContext context) async {
    if (kIsWeb) {
      await showDialog(context: context, builder: (context) => this);
    } else {
      await showModal(
        configuration: FadeScaleTransitionConfiguration(
          transitionDuration: context.fast,
        ),
        context: context,
        builder: (context) => this,
      );
    }
  }

  @override
  Widget buildAndroidWidget(BuildContext context) {
    return AlertDialog(
      title: title ?? Container(),
      content: content,
      actions: _setDialogButton(context),
    );
  }

  @override
  Widget buildIOSWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: title ?? Container(),
      content: content,
      actions: _setDialogButton(context),
    );
  }

  @override
  Widget buildMainWidget(BuildContext context) {
    return AlertDialog(
      title: title ?? Container(),
      content: content,
      actions: _setDialogButton(context),
    );
  }

  List<Widget> _setDialogButton(BuildContext context) {
    final allButtons = <Widget>[];
    if (kIsWeb) {
      addButton(allButtons, context);
    } else if (Platform.isIOS) {
      addCupertino(allButtons, context);
    } else {
      addButton(allButtons, context);
    }
    return allButtons;
  }

  void addButton(allButtons, BuildContext context) {
    if (leftButtonText != '') {
      allButtons.add(
        Padding(
          padding: getLeftButtonPadding(context),
          child: TextButton(
            style: defaultButtonStyle(context),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              leftButtonText,
              style: context.headline5.copyWith(color: Colors.red),
            ),
          ),
        ),
      );
    }
    allButtons.add(
      Padding(
        padding: getButtonPadding(context),
        child: TextButton(
          style: defaultButtonStyle(context),
          onPressed: () async {
            Navigator.of(context).pop();
            if (provider != '') {}
            await action();
            if (provider != '') {
              errorDialogHelper(provider, context);
            }
          },
          child: Text(
            rightButtonText,
            style: context.headline5,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void addCupertino(allButtons, BuildContext context) {
    if (leftButtonText != '') {
      allButtons.add(
        Padding(
          padding: getLeftButtonPadding(context),
          child: CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              leftButtonText,
              style: context.headline5.copyWith(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
    allButtons.add(
      Padding(
        padding: getButtonPadding(context),
        child: CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
            action();
          },
          child: Text(
            rightButtonText,
            style: context.headline5,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  EdgeInsets getButtonPadding(BuildContext context) {
    return EdgeInsets.only(
        right: context.width * .3, bottom: context.width * .4);
  }

  EdgeInsets getLeftButtonPadding(BuildContext context) {
    return EdgeInsets.only(bottom: context.width * .4);
  }

  ButtonStyle defaultButtonStyle(BuildContext context) {
    return TextButton.styleFrom(
      padding: EdgeInsets.zero,
      minimumSize: Size(context.width * 3.4, context.height * 4),
    );
  }
}
