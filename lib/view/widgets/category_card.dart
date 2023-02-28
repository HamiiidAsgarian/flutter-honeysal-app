import 'package:flutter/material.dart';

import '../../consts.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          // color: Colors.red,
          boxShadow: const [
            BoxShadow(
                blurRadius: 5,
                color: Color.fromARGB(110, 180, 180, 180),
                spreadRadius: 2)
          ]),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                // widthFactor: 1,
                aspectRatio: 1,
                child: Container(color: Colors.green),
              ),
              const SizedBox(width: 5),
              const Text("name of the chocolate",
                  style: AppConst.productTitleStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("45 left", style: AppConst.productSubtitleStyle),
                  const Text("  |  ", style: AppConst.productSubtitleStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.star_rounded,
                        color: AppConst.mainOrange,
                        size: 20,
                      ),
                      Text("5.0", style: AppConst.productSubtitleStyle)
                    ],
                  )
                ],
              ),
              RichText(
                text: const TextSpan(
                  text: '${0.99} ',
                  style: AppConst.productTitleStyle,
                  children: <TextSpan>[
                    TextSpan(
                      text: '/a piece',
                      style: AppConst.productSubtitleStyle,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                          highlightColor: Colors.red,
                          elevation: 0,
                          splashColor: AppConst.mainOrange,
                          color: AppConst.mainOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)),
                          onPressed: () {},
                          child: const Text("Add to Cart"))),
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: HeartButton(
              onTap: (isActive) {
                print(isActive);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HeartButton extends StatefulWidget {
  final bool isActive;
  final Function(bool isActive) onTap;

  const HeartButton({
    Key? key,
    this.isActive = false,
    required this.onTap,
  }) : super(key: key);

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  late bool _isActive;

  @override
  void initState() {
    _isActive = widget.isActive;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      key: UniqueKey(),
      duration: const Duration(milliseconds: 400),
      tween: Tween(begin: 5.0, end: 20.0),
      curve: Curves.easeInOutBack,
      builder: (context, value, child) => GestureDetector(
        onTap: () {
          widget.onTap(!_isActive);
          setState(() {
            _isActive = !_isActive;
          });
        },
        child: SizedBox(
          width: 20,
          height: 20,
          child: Center(
            child: Icon(
              Icons.favorite,
              color: _isActive ? Colors.red : AppConst.borderGrey,
              size: value,
            ),
          ),
        ),
      ),
    );
  }
}
