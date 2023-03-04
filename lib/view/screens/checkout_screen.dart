import 'package:bakery/consts.dart';
import 'package:bakery/view/widgets/app_bar.dart';
import 'package:bakery/view/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../widgets/category_card.dart';
import 'cart_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController dateinput = TextEditingController();
  final TextEditingController _timeInputController = TextEditingController();
  final TextEditingController _phoneInputController = TextEditingController();
  final TextEditingController _creditInputController = TextEditingController();

  String selectedPhoneCode = "+97";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(),
        bottomNavigationBar: const MyNav(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConst.appHorizontalPadding),
            child: Column(
              children: [
                const SizedBox(height: 10),
                CustomTextInput(
                  keyboardType: TextInputType.datetime,
                  textEditingController: dateinput,
                  title: "pickup date",
                  hint: '2033/12/12',
                  mask: '####/##/##',
                  suffix: IconButton(
                      icon: const Icon(
                        Icons.calendar_month,
                        color: AppConst.iconGrey,
                        size: 30,
                      ),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  colorScheme: const ColorScheme.light(
                                      primary: AppConst.mainOrange),
                                ),
                                child: child!,
                              );
                            });

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy/MM/dd').format(pickedDate);
                          setState(() {
                            dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          // print("Date is not selected");
                        }
                      }),
                ),
                const SizedBox(height: 10),
                CustomTextInput(
                  keyboardType: TextInputType.visiblePassword,
                  textEditingController: _timeInputController,
                  title: "pickup time",
                  hint: '05:00 AM',
                  mask: '##:## AA',
                  suffix: IconButton(
                      icon: const Icon(
                        Icons.timer_outlined,
                        color: AppConst.iconGrey,
                        size: 30,
                      ),
                      onPressed: () async {
                        TimeOfDay? selectedTime = await showTimePicker(
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: const ColorScheme.light(
                                  // change the border color
                                  primary: AppConst.mainOrange,
                                  // change the text color
                                  onSurface: AppConst.iconGrey,
                                ),
                                // button colors
                                buttonTheme: const ButtonThemeData(
                                  colorScheme: ColorScheme.light(
                                    primary: Colors.green,
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if (selectedTime != null) {
                          setState(() {
                            _timeInputController.text =
                                selectedTime.format(context);
                            //set output date to TextField value.
                          });
                        } else {
                          // print("Date is not selected");
                        }
                      }),
                ),
                const SizedBox(height: 10),
                CustomTextInput(
                  keyboardType: TextInputType.number,
                  textEditingController: _phoneInputController,
                  title: "Telephone number",
                  hint: '9365475986',
                  mask: '##########',
                  prefix: Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: AppConst.borderGrey, width: 2))),
                    width: 70,
                    child: PopupMenuButton(
                      // padding: EdgeInsets.symmetric(horizontal: 5),
                      icon: Text("$selectedPhoneCode▼",
                          style: AppConst.normalDescriptionStyle),
                      initialValue: selectedPhoneCode,
                      onSelected: (value) {
                        setState(() {
                          selectedPhoneCode = value;
                        });
                      },
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
                ),
                const SizedBox(height: 10),
                CustomTextInput(
                  keyboardType: TextInputType.number,
                  textEditingController: _creditInputController,
                  title: "Payment Method",
                  hint: '****-****-****-****',
                  mask: '####-####-####-####',
                  suffix: IconButton(
                      icon: const Icon(
                        Icons.check_circle,
                        color: AppConst.iconGrey,
                        size: 30,
                      ),
                      onPressed: () async {}),
                ),
                const SizedBox(height: 25),
                const CostsSection()
              ],
            ),
          ),
        ));
  }
}

class CostsSection extends StatelessWidget {
  const CostsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
            // color: Colors.red,
            border: Border(top: BorderSide(color: AppConst.borderGrey))),
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const RecieptRow(
              title: "Subtotal",
              price: "\$${29.8}",
            ),
            const RecieptRow(
              title: "Discount",
              price: "\$${29.8}",
            ),
            const RecieptRow(
              title: "Total",
              price: "\$${29.8}",
              style: RecieptRowStyle.bold,
            ),
            MainButton(onPress: () {}, title: "Checkout")
          ],
        ));
  }
}

class CustomTextInput extends StatelessWidget {
  final String? mask;
  final String title;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  // final Function onPressIcon;
  final Color? fillColor;
  final TextInputType? keyboardType;

  final TextEditingController? textEditingController;

  const CustomTextInput(
      {super.key,
      this.mask,
      this.title = 'title',
      this.hint,
      this.suffix,
      // required this.onPressIcon,
      this.fillColor,
      this.prefix,
      this.textEditingController,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppConst.normalDescriptionStyle),
        const SizedBox(height: 5),
        TextField(
          cursorColor: AppConst.mainOrange,
          keyboardType: keyboardType,
          inputFormatters: [
            MaskTextInputFormatter(mask: mask),
          ],
          controller:
              textEditingController, //editing controller of this TextField
          decoration: InputDecoration(
              filled: fillColor != null,
              fillColor: fillColor,
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppConst.mainOrange,
                  width: 2.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppConst.mainGrey,
                  width: 1.0,
                ),
              ),
              suffixIcon: suffix,
              prefixIcon: prefix
              // labelText: "Enter Date" //label text of field
              ),
          // readOnly:
          //     true, //set it true, so that user will not able to edit text
        ),
      ],
    );
  }
}
