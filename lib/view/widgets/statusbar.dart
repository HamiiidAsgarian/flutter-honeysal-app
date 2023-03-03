import 'package:flutter/material.dart';

import '../../consts.dart';
import 'my_rounded_button.dart';

class Statusbar extends StatefulWidget {
  const Statusbar({
    Key? key,
  }) : super(key: key);

  @override
  State<Statusbar> createState() => _StatusbarState();
}

class _StatusbarState extends State<Statusbar> {
  bool searchMode = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppConst.appHorizontalPadding),
      child: ClipPath(
        clipper: const ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        child: Container(
          decoration: BoxDecoration(
            color: AppConst.borderGrey.withOpacity(.1),
            border: const Border(
                bottom: BorderSide(width: 5, color: AppConst.mainOrange)),
            // color: Colors.red,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  // color: Colors.red,
                  child: titleGenerator(searchMode),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyRoundButton(
                    icon: Icons.search,
                    onTap: (isSelected) {
                      setState(() {
                        searchMode = isSelected;
                      });
                    },
                    selectionStatus: searchMode,
                  ),
                  const SizedBox(width: 10),
                  const CircleAvatar(
                    backgroundColor: AppConst.mainOrange,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  titleGenerator(bool searchOn) {
    if (searchOn == true) {
      return TweenAnimationBuilder(
          key: UniqueKey(),
          duration: const Duration(milliseconds: 400),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (BuildContext context, double? value, Widget? child) {
            return Opacity(
              opacity: value ?? 0,
              child: const SizedBox(
                width: 50,
                height: 50,
                child: TextField(
                  cursorColor: AppConst.mainOrange,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      hintText: "Search products",
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
            );
          });
    }

    return TweenAnimationBuilder(
      key: UniqueKey(),
      duration: const Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (BuildContext context, double? value, Widget? child) {
        return Opacity(
          opacity: value ?? 0,
          child: const SizedBox(
            width: 50,
            height: 50,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Good morning',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
          ),
        );
      },
    );
  }
}
