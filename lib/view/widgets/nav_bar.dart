import 'package:flutter/material.dart';

import '../../consts.dart';

class MyNav extends StatelessWidget {
  const MyNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      height: 70,
      decoration: const BoxDecoration(color: AppConst.mainWhite, boxShadow: [
        BoxShadow(
          color: Color.fromARGB(36, 0, 0, 0),
          offset: Offset(0, -1),
          blurRadius: 2,
          spreadRadius: 1,
        )
      ]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
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
            NavItem(
              icon: Icons.notification_add_outlined,
              tite: "Notifications",
            ),
          ]),
    );
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
    return GestureDetector(
        onTap: () {
          onPress != null ? onPress!() : null;
        },
        child: Column(
          children: [
            icon != null
                ? Icon(icon, color: AppConst.iconGrey)
                : const SizedBox(),
            tite != null
                ? Text(tite!, style: AppConst.productSubtitleStyle)
                : const SizedBox()
          ],
        ));
  }
}
