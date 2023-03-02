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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: AppConst.sectionTitleStyle)),
          TextButton(
              onPressed: () => onPressAll(),
              child: const Text(
                "view All",
                style: TextStyle(color: AppConst.burnedOrange),
              ))
        ],
      ),
    );
  }
}
