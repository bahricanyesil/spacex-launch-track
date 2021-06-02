import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/core_shelf.dart';

class WikipediaLink extends StatelessWidget {
  final String link;
  const WikipediaLink({required this.link});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: context.width * 4),
        Icon(
          Icons.public_outlined,
          color: context.primary.withOpacity(.66),
          size: context.width * 5.4,
        ),
        SizedBox(width: context.width * 2),
        GestureDetector(
          onTap: () => _launchURL(context),
          child: Text(
            'wikipedia_link'.translate,
            style: context.headline6
                .copyWith(color: context.primary.withOpacity(.75)),
          ),
        ),
      ],
    );
  }

  Future<void> _launchURL(BuildContext context) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      await CustomDialog(
        content: Text(
          'cannot_launch_link'.translate,
          style: context.headline6,
        ),
        rightButtonText: 'ok'.translate,
      ).show(context);
    }
  }
}
