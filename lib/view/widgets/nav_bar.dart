import 'package:flutter/material.dart';

import '../../consts.dart';

class MyNav extends StatefulWidget {
  const MyNav({super.key});

  @override
  State<MyNav> createState() => _MyNavState();
}

class _MyNavState extends State<MyNav> {
  @override
  Widget build(BuildContext context) {
    return const Nav(
      inputs: [
        NavItem(
          icon: Icons.home,
          tite: "Home",
        ),
        NavItem(
          icon: Icons.card_travel_outlined,
          tite: "Cart",
        ),
        NavItem(
          icon: Icons.receipt_long_outlined,
          tite: "Orders",
        ),
      ],
    );
  }
}

class Nav extends StatefulWidget {
  final List<Widget> inputs;
  const Nav({
    Key? key,
    required this.inputs,
  }) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int initIndex = 0;
  late List<Widget> inputs;
  // because there is [-1,0,1] in alighment gap
  late double gapPerItems;

  //list of calculated alignments based on gaps for Dynamic Selector to move to
  List<double> alignVals = [];
  //list of aligned inputs to place in the nav
  List<Widget> options = [];

  @override
  void initState() {
    inputs = widget.inputs;
    gapPerItems = (2 / (inputs.length - 1));

    alignAndOptionsPositionCreator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              alignment: Alignment(alignVals[initIndex], 0),
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: 100,
                  width: 75,
                  decoration: BoxDecoration(
                      borderRadius:
                          borderRadiusDenerator(initIndex, inputs.length - 1),
                      color: AppConst.mainOrange),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: options),
          )
        ],
      ),
    );
  }

  alignAndOptionsPositionCreator() {
    double temp = -1.0;
    for (var i = 0; i < inputs.length; i++) {
      //adding options
      options.add(Align(
        alignment: Alignment(temp, 0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              initIndex = i;
            });
          },
          child: SizedBox(
            width: 50,
            height: 50,
            // color: Colors.red,
            child: GestureDetector(
              child: FittedBox(child: inputs[i]),
            ),
          ),
        ),
      ));
      //adding positions
      alignVals.add(temp);
      temp = temp + gapPerItems;
    }
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
