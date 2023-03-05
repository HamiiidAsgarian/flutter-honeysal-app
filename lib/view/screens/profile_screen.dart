import 'package:bakery/consts.dart';
import 'package:bakery/view/widgets/my_rounded_button.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  static String route = "/ProfileScreen";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      bottomNavigationBar: const MyNav(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: AppConst.mainWhite,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: AppConst.mainOrange)),
                  child: Stack(children: [
                    Align(
                        alignment: Alignment.bottomRight,
                        child: MyRoundButton(
                            selectionStatus: true,
                            type: CutomRoundedButtonType.pusher,
                            onTap: (isSelected) {},
                            fillColor: AppConst.mainWhite,
                            icon: Icons.edit_note))
                  ]),
                ),
              ),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Hamiiid Asgharian",
                    style: AppConst.sectionTitleStyle),
                const SizedBox(width: 5),
                MyRoundButton(
                    selectionStatus: true,
                    type: CutomRoundedButtonType.pusher,
                    onTap: (isSelected) {},
                    fillColor: AppConst.mainWhite,
                    icon: Icons.edit_note)
              ]),
              const SizedBox(height: 20),
              const Text("Account", style: AppConst.productSubtitleStyle),
              const SizedBox(height: 10),
              Column(
                  children: List.generate(
                      5,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Ink(
                              height: 60,
                              // padding: const EdgeInsets.symmetric(
                              //     horizontal: AppConst.appHorizontalPadding),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppConst.mainWhite,
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 5, color: AppConst.mainGrey)
                                  ]),
                              child: InkWell(
                                splashColor: AppConst.mainOrange,
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.lock_clock_outlined,
                                              color: AppConst.mainOrange),
                                          const SizedBox(width: 10),
                                          Text("text place $index",
                                              style: AppConst
                                                  .normalDescriptionStyle)
                                        ],
                                      ),
                                      const Icon(Icons.arrow_forward_ios,
                                          size: 20)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )))
            ],
          ),
        ),
      ),
    );
  }
}
