import 'package:flutter/material.dart';

import '../../../../../core/core_shelf.dart';

class LaunchDate extends StatelessWidget {
  final DateTime launchDate;
  const LaunchDate({required this.launchDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: context.width * 4),
        Icon(
          Icons.calendar_today_outlined,
          color: context.primary.withOpacity(.66),
          size: context.width * 5.4,
        ),
        SizedBox(width: context.width * 2),
        Text(
          dateTimeHelper(launchDate),
          style: context.headline6
              .copyWith(color: context.primary.withOpacity(.75)),
        ),
      ],
    );
  }
}
