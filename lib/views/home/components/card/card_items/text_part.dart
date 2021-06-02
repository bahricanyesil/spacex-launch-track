import 'package:flutter/material.dart';

import '../../../../../core/core_shelf.dart';

class TextPart extends StatelessWidget {
  final String name;
  final String details;
  const TextPart({required this.name, required this.details});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalMedium,
      child: Column(
        children: [
          _title(context),
          SizedBox(height: context.height * 2),
          _subTitle(context)
        ],
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(name, style: context.headline2);
  }

  Padding _subTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 5.3),
      child: SizedBox(
        height: context.height * 22,
        child: Scrollbar(
          isAlwaysShown: false,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Text(
              details,
              style: context.headline6.copyWith(color: Colors.black54),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }
}
