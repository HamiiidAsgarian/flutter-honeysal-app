import 'package:flutter/material.dart';

import '../../consts.dart';

class Nav extends StatelessWidget {
  final int index;

  final Function(int index) onTap;
  final List<Widget> inputs;
  const Nav({
    Key? key,
    required this.inputs,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //list of calculated alignments based on gaps for Dynamic Selector to move to
    double gapPerItems = (2 / (inputs.length - 1));
    //list of aligned inputs to place in the nav
    List alignAndPositions = alignAndOptionsPositionCreator(gapPerItems);
    List<double> selectorStopPositions = alignAndPositions[0];
    List<Widget> items = alignAndPositions[1];

    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 0),
      decoration: const BoxDecoration(color: AppConst.mainWhite, boxShadow: [
        BoxShadow(
          color: Color.fromARGB(36, 0, 0, 0),
          offset: Offset(0, -1),
          blurRadius: 2,
          spreadRadius: 1,
        )
      ]),
      height: 70,
      child: Stack(
        children: [
          AnimatedContainer(
              curve: Curves.linearToEaseOut,
              alignment: Alignment(selectorStopPositions[index], 0),
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: 100,
                  width: 75,
                  decoration: BoxDecoration(
                      borderRadius:
                          borderRadiusDenerator(index, inputs.length - 1),
                      color: AppConst.mainOrange),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: items),
          )
        ],
      ),
    );
  }

  alignAndOptionsPositionCreator(gapPerItems) {
    double temp = -1.0;
    List<Widget> items = [];
    List<double> alignVals = [];

    for (var i = 0; i < inputs.length; i++) {
      items.add(GestureDetector(
        onTap: () {
          onTap(i);
        },
        child: Align(
          alignment: Alignment(temp, 0),
          child: SizedBox(
            width: 50,
            height: 50,
            child: FittedBox(child: inputs[i]),
          ),
        ),
      ));
      //adding positions
      alignVals.add(temp);
      temp = temp + gapPerItems;
    }
    return [alignVals, items];
  }

  borderRadiusDenerator(int index, int itemsLength) {
    List<double> values = [25, 25, 25, 25];
    if (index == 0) {
      values = [5, 25, 5, 25];
    }
    if (index == itemsLength) {
      values = [25, 2, 25, 5];
    }
    return BorderRadiusDirectional.only(
        topStart: Radius.circular(values[0]),
        topEnd: Radius.circular(values[1]),
        bottomEnd: Radius.circular(values[2]),
        bottomStart: Radius.circular(values[3]));
  }
}

class NavItem extends StatelessWidget {
  final String? tite;
  final IconData? icon;
  final Function? onPress;
  const NavItem({
    Key? key,
    this.tite,
    this.icon,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon != null ? Icon(icon, color: AppConst.iconGrey) : const SizedBox(),
        tite != null
            ? Text(tite!, style: AppConst.productSubtitleStyle)
            : const SizedBox()
      ],
    );
  }
}
