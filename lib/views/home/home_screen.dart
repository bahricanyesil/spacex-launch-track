import 'package:flutter/material.dart';

import '../../core/core_shelf.dart';
import 'components/components_shelf.dart';
import 'functions/functions_shelf.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late LaunchTrack lastLaunch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Padding(padding: context.verticalHigh, child: getFutureBuilder()));
  }

  Widget getFutureBuilder() {
    return FutureBuilder(
      future: getLastTrack(),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : mainColumn(),
    );
  }

  Widget mainColumn() {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: HomeCard(
            lastLaunch: lastLaunch,
          ),
        ),
        Expanded(
          child: changeLanguage(),
        )
      ],
    );
  }

  Widget changeLanguage() {
    final isTurkish = Localizations.localeOf(context).languageCode == 'tr';
    return Container(
      width: context.width * (isTurkish ? 50 : 42),
      margin: context.verticalLow,
      child: ElevatedButton(
          style: context.defaultButtonStyle,
          onPressed: () => changeLang(context, isTurkish),
          child: getButtonContent(isTurkish)),
    );
  }

  Widget getButtonContent(bool isTurkish) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          isTurkish ? 'usa'.toPng : 'tr'.toPng,
          width: context.width * 5,
        ),
        SizedBox(width: context.width),
        Text(
          isTurkish
              ? 'translate_to_english'.translate
              : 'translate_to_turkish'.translate,
          style: context.headline6.copyWith(color: Colors.white),
        ),
      ],
    );
  }

  Future<void> getLastTrack() async {
    final launchTrackProvider =
        Provider.of<LaunchTrackProvider>(context, listen: false);
    final lastLaunchRes = await launchTrackProvider.getLastLaunch();
    if (errorDialogHelper(launchTrackProvider, context)) {
      lastLaunch = lastLaunchRes!;
    }
  }
}
