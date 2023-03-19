import 'package:flutter/material.dart';
import '../../consts.dart';

class TitleAndAll extends StatelessWidget {
  final String title;
  final Function onPressAll;
  const TitleAndAll({
    Key? key,
    required this.title,
    required this.onPressAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppConst.sectionTitleStyle),
        TextButton(
            onPressed: () {
              onPressAll();
            },
            child: Text("View All",
                style: AppConst.chipTextStyle.copyWith(
                  color: AppConst.burnedOrange,
                )))
      ],
    );
  }
}
