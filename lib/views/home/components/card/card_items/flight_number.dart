import 'package:flutter/material.dart';

import '../../../../../core/core_shelf.dart';

class FlightNumber extends StatelessWidget {
  final int flightNumber;
  const FlightNumber({required this.flightNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: context.width * 4),
        Icon(
          Icons.format_list_numbered_outlined,
          color: context.primary.withOpacity(.66),
          size: context.width * 5.4,
        ),
        SizedBox(width: context.width * 2),
        Text(
          '${'flight_number'.translate}: ${flightNumber.toString()}',
          style: context.headline6
              .copyWith(color: context.primary.withOpacity(.75)),
        ),
      ],
    );
  }
}
