import 'package:flutter/material.dart';

import '../../../../core/core_shelf.dart';
import 'card_items/card_items_shelf.dart';

class HomeCard extends StatelessWidget {
  final LaunchTrack lastLaunch;
  const HomeCard({required this.lastLaunch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.highPadding,
      child: _mainSection(context),
    );
  }

  Container _mainSection(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDeco.card(context),
      padding: context.verticalHigh,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: _image(context),
          ),
          Expanded(
            flex: 5,
            child: TextPart(
              details: lastLaunch.details,
              name: lastLaunch.name,
            ),
          ),
          Expanded(
            flex: 2,
            child: getInnerColumn(context),
          ),
        ],
      ),
    );
  }

  Column getInnerColumn(BuildContext context) {
    return Column(
      children: [
        FlightNumber(flightNumber: lastLaunch.flightNumber),
        SizedBox(height: context.height * 2),
        LaunchDate(launchDate: lastLaunch.launchDate),
        SizedBox(height: context.height * 2),
        WikipediaLink(link: lastLaunch.wikipediaLink),
      ],
    );
  }

  Padding _image(BuildContext context) {
    return Padding(
      padding: context.verticalHigh,
      child: FadeInImage.assetNetwork(
        placeholder: 'loading'.toGif,
        fit: BoxFit.fitWidth,
        image: lastLaunch.patch,
      ),
    );
  }
}
