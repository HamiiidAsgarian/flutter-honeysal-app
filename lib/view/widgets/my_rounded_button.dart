import 'package:flutter/material.dart';

import '../../consts.dart';

class MyRoundButton extends StatefulWidget {
  final Function(bool isSelected) onTap;
  final bool selectionStatus;
  final double iconSize;
  final IconData? icon;
  final double? width;
  final double? height;
  final Color? fillColor;
  final Color selectedColor;

  final CutomRoundedButtonType? type;

  const MyRoundButton(
      {super.key,
      required this.onTap,
      this.type = CutomRoundedButtonType.switcher,
      this.selectionStatus = false,
      this.iconSize = 20,
      this.icon,
      this.width = 40,
      this.height = 40,
      this.fillColor = Colors.transparent,
      this.selectedColor = AppConst.mainOrange});

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
      width: widget.width,
      height: widget.height,
      child: Material(
        // ink border color disappears when parrent widget has color so adding material fix the issue
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            color: widget.fillColor,
            // color: searchMode == true ? AppConst.mainColor : null,
            border: Border.all(
                color: (_selectionStatus == true &&
                        widget.type == CutomRoundedButtonType.switcher)
                    ? widget.selectedColor
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
              color: (_selectionStatus == true &&
                      widget.type == CutomRoundedButtonType.switcher)
                  ? widget.selectedColor
                  : AppConst.iconGrey,
              size: widget.iconSize,
            ),
          ),
        ),
      ),
    );
  }
}

enum CutomRoundedButtonType { switcher, pusher }
