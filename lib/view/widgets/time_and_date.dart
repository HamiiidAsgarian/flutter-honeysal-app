import 'package:flutter/material.dart';

import '../../consts.dart';

class TimeAndDate extends StatelessWidget {
  const TimeAndDate({
    Key? key,
    required this.time,
    required this.date,
  }) : super(key: key);

  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          // color: Colors.red,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.timer_outlined,
                color: AppConst.iconGrey,
                size: 20,
              ),
              const SizedBox(width: 5),
              Text(time, style: AppConst.smallTextStyle)
            ],
          ),
        ),
        // SizedBox(height: 5),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 20,
            child: const VerticalDivider(
              thickness: 2,
              width: 2,
              color: AppConst.borderGrey,
            )),
        Text(date, style: AppConst.smallTextStyle)
      ],
    );
  }
}
