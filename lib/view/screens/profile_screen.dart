import 'package:bakery/consts.dart';
import 'package:bakery/model/core_models/user_model.dart';
import 'package:bakery/view/widgets/my_rounded_button.dart';
import 'package:bakery/view/widgets/vertical_card.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class ProfileScreen extends StatelessWidget {
  static String route = "/ProfileScreen";

  final bool backButton;

  final User? data;

  const ProfileScreen({super.key, required this.data, this.backButton = false});

  @override
  Widget build(BuildContext context) {
    List<String> options = ['Privacy policiy', 'Contact us', "About us"];
    return Scaffold(
      appBar: backButton == true
          ? CustomAppbar(
              backButton: backButton,
            )
          : null,
      // bottomNavigationBar: const MyNav(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileDataGenerator(data),
              const SizedBox(height: 20),
              const Text("Account", style: AppConst.productSubtitleStyle),
              const SizedBox(height: 10),
              Column(
                  children: options
                      .map((option) => Padding(
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
                                          Text(option,
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
                          ))
                      .toList()),
              const SizedBox(height: 10),
              if (data != null)
                MainButton(title: "Log out", onPress: () {})
              else
                MainButton(title: "Log in", onPress: () {})
            ],
          ),
        ),
      ),
    );
  }

  Widget profileDataGenerator(User? data) {
    if (data != null) {
      return Column(
        children: [
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(data.imageUrl ?? ""),
                      fit: BoxFit.fill),
                  color: AppConst.mainWhite,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: AppConst.mainOrange)),
              child: Stack(children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: MyRoundButton(
                        isActive: true,
                        type: CutomRoundedButtonType.pusher,
                        onTap: (isSelected) {},
                        fillColor: AppConst.mainWhite,
                        icon: Icons.edit_note))
              ]),
            ),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(data.username, style: AppConst.sectionTitleStyle),
            const SizedBox(width: 5),
            MyRoundButton(
                isActive: true,
                type: CutomRoundedButtonType.pusher,
                onTap: (isSelected) {},
                fillColor: AppConst.mainWhite,
                icon: Icons.edit_note)
          ]),
        ],
      );
    }
    return const SizedBox();
  }
}
