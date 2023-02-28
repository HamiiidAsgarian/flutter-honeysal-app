import 'package:flutter/material.dart';

import '../../consts.dart';

class MyRoundButton extends StatefulWidget {
  final Function(bool isSelected) onTap;
  final bool selectionStatus;
  final double iconSize;
  final IconData? icon;

  const MyRoundButton(
      {super.key,
      required this.onTap,
      required this.selectionStatus,
      this.iconSize = 20,
      this.icon});

  @override
  State<MyRoundButton> createState() => _MyRoundButtonState();
}

class _MyRoundButtonState extends State<MyRoundButton> {
  late bool _selectionStatus;

  @override
  void initState() {
    _selectionStatus = widget.selectionStatus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Material(
        // ink border color disappears when parrent widget has color so adding material fix the issue
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            // color: searchMode == true ? AppConst.mainColor : null,
            border: Border.all(
                color: _selectionStatus == true
                    ? AppConst.mainOrange
                    : AppConst.borderGrey,
                width: 2),
            // color: Colors.grey,
            shape: BoxShape.circle,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              widget.onTap(!_selectionStatus);
              setState(() {
                // widget.onTap(_selectionStatus);
                _selectionStatus = !_selectionStatus;
              });
            },
            child: Icon(
              widget.icon,
              color: _selectionStatus == true
                  ? AppConst.mainOrange
                  : AppConst.borderGrey,
              size: widget.iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
