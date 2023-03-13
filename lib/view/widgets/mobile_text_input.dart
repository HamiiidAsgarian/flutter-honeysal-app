import 'package:bakery/consts.dart';
import 'package:flutter/material.dart';

import '../screens/checkout_screen.dart';

class MobileTextInput extends StatelessWidget {
  final TextEditingController phoneInputController;
  final Function(String selected) onSelected;
  final Function(String? value) validator;

  final String selectedPhoneCode;
  const MobileTextInput(
      {super.key,
      required this.phoneInputController,
      required this.onSelected,
      required this.selectedPhoneCode,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return CustomTextInput(
      validator: (v) {
        print("v");
        return validator(v);
      },
      keyboardType: TextInputType.number,
      textEditingController: phoneInputController,
      title: "Telephone number",
      hint: '9365475986',
      mask: '##########',
      prefix: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: const BoxDecoration(
            border: Border(
                right: BorderSide(color: AppConst.borderGrey, width: 2))),
        width: 80,
        child: PopupMenuButton(
          // padding: EdgeInsets.symmetric(horizontal: 5),
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(selectedPhoneCode, style: AppConst.normalDescriptionStyle),
              const Icon(Icons.arrow_drop_down, color: AppConst.mainBlack)
            ],
          ),
          initialValue: selectedPhoneCode,
          onSelected: (value) => onSelected(value),
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "+98",
                child: Text("+98(Iran)"),
              ),
              const PopupMenuItem(
                value: "+1",
                child: Text("+1(US)"),
              ),
              const PopupMenuItem(
                value: "+56",
                child: Text("+56(Nalga)"),
              )
            ];
          },
        ),
      ),
      suffix: IconButton(
          icon: const Icon(
            Icons.check_circle,
            color: AppConst.iconGrey,
            size: 30,
          ),
          onPressed: () async {}),
    );
  }
}
