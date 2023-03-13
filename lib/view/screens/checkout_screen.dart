import 'package:bakery/consts.dart';
import 'package:bakery/model/core_models/order_model.dart';
import 'package:bakery/services/send_order_form.dart';
import 'package:bakery/view/screens/pickup_screen.dart';
import 'package:bakery/view/widgets/app_bar.dart';
import 'package:bakery/view_model/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../view_model/cart_bloc.dart';
import '../widgets/mobile_text_input.dart';
import '../widgets/vertical_card.dart';
import 'cart_screen.dart';

class CheckoutScreen extends StatefulWidget {
  static String route = "/CheckoutScreen";

  final bool backButton;
  const CheckoutScreen({super.key, this.backButton = false});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController dateinput = TextEditingController();
  final TextEditingController _timeInputController = TextEditingController();
  final TextEditingController _phoneInputController = TextEditingController();
  final TextEditingController _creditInputController = TextEditingController();

  String selectedPhoneCode = "+97";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(title: 'Checkout', backButton: widget.backButton),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConst.appHorizontalPadding),
            child: Form(
              key: _formKey,
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
                      },
                    ),
                    validator: (value) {
                      print(value);
                      if (value != null &&
                          value.isNotEmpty &&
                          value.length >= 10) {
                        List<String> hourMinute = value.split("/");
                        int year = int.parse(hourMinute[0]);
                        int month = int.parse(hourMinute[1]);
                        int days = int.parse(hourMinute[2]);

                        if (DateTime(year, month, days)
                                .isAfter(DateTime.now()) &&
                            month <= 12 &&
                            days <= 30) {
                          return null;
                        }
                      }
                      return "Please Enter in currect format(yyyy/mm/dd)";
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextInput(
                    validator: (value) {
                      print(value);
                      if (value != null &&
                          value.isNotEmpty &&
                          value.length >= 5) {
                        List<String> hourMinute = value.split(":");
                        int hour = int.parse(hourMinute[0]);
                        late int minute;
                        if (hourMinute[1].length > 2) {
                          minute = int.parse(hourMinute[1].substring(0, 2));
                        } else {
                          minute = int.parse(hourMinute[1]);
                        }
                        if (hour < 24 && minute < 60) {
                          return null;
                        }
                      }
                      return "Please Enter in currect format(23:59)";
                    },
                    keyboardType: TextInputType.visiblePassword,
                    textEditingController: _timeInputController,
                    title: "pickup time",
                    hint: '19:00',
                    mask: '##:##',
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
                  MobileTextInput(
                    validator: (value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          value.length == 10) {
                        return null;
                      }
                      return "Please Enter in valid phone number";
                    },
                    selectedPhoneCode: selectedPhoneCode,
                    onSelected: (String selected) {
                      setState(() {
                        selectedPhoneCode = selected;
                      });
                    },
                    phoneInputController: _phoneInputController,
                  ),
                  const SizedBox(height: 10),
                  CustomTextInput(
                    validator: (value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          value.length == 19) {
                        return null;
                      }
                      return "Please Enter in valid phone number";
                    },
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
                  CostsSection(onPressCheckout: () async {
                    // print(_formKey.currentState!.validate());
                    if (_formKey.currentState!.validate()) {
                      // print("aa");
                      _formKey.currentState!.save();

                      showAlertDialog(context);

                      await sendOrderForm().then((value) {
                        Order res = Order.fromMap(value);
                        Navigator.pop(context);
                        BlocProvider.of<OrderBloc>(context)
                            .add(AddOrder(data: res));

                        BlocProvider.of<CartBloc>(context).add(EmptyTheCart());
                        // if (value != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PickupScreen(
                                      data: res,
                                      backButton: false,
                                    ))));
                        // }
                        return value;
                      });
                    }
                  })
                ],
              ),
            ),
          ),
        ));
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: FutureBuilder(
          future: sendOrderForm(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                children: [
                  // const CircularProgressIndicator(),
                  Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: const Text("OK")),
                ],
              );
            }
            return Row(
              children: [
                const CircularProgressIndicator(),
                Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: const Text("Loading")),
              ],
            );
          }),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class CostsSection extends StatelessWidget {
  // final GlobalKey<FormState> formValidator;
  final Function onPressCheckout;

  const CostsSection({
    Key? key,
    required this.onPressCheckout,
    // required this.formValidator,
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
            MainButton(
                onPress: () {
                  onPressCheckout();
                },
                title: "Checkout")
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
  final Function(String? value)? validator;

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
      this.keyboardType,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppConst.normalDescriptionStyle),
        const SizedBox(height: 5),
        TextFormField(
          validator: (v) {
            return validator!(v);
          },
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
