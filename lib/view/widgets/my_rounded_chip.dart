import 'package:flutter/material.dart';

import '../../consts.dart';

class MyRoundedChip extends StatelessWidget {
  final Function(bool isSelected) onTap;
  final bool? selectionStatus;
  final double iconSize;
  final IconData? icon;
  final Widget? child;

  const MyRoundedChip(
      {super.key,
      required this.onTap,
      this.selectionStatus = false,
      this.iconSize = 20,
      this.icon,
      this.child});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 20),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          // width: 60,
          // height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: selectionStatus == true
                ? AppConst.lightOrange
                : AppConst.whiteOrange,
            shape: BoxShape.rectangle,
          ),
          child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {
                onTap(selectionStatus ?? false);

                // widget.onTap(_selectionStatus);
                // selectionStatus = !selectionStatus;
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Center(child: child),
              )),
        ),
      ),
    );
  }
}
