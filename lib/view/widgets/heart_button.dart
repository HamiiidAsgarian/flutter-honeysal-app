import 'package:flutter/material.dart';

import '../../consts.dart';

class HeartButton extends StatelessWidget {
  final bool isActive;
  final Function(bool isActive) onTap;

  const HeartButton({
    Key? key,
    this.isActive = false,
    required this.onTap,
  }) : super(key: key);

//   @override
//   State<HeartButton> createState() => _HeartButtonState();
// }

// class _HeartButtonState extends State<HeartButton> {
//   late bool _isActive;

//   @override
//   void initState() {
//     _isActive = widget.isActive;

//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      key: UniqueKey(),
      duration: const Duration(milliseconds: 400),
      tween: Tween(begin: 5.0, end: 30.0),
      curve: Curves.easeInOutBack,
      builder: (context, value, child) => GestureDetector(
        onTap: () {
          onTap(!isActive);
        },
        child: SizedBox(
          width: 30,
          height: 30,
          child: Center(
            child: Icon(
              Icons.favorite_border,
              color: isActive ? Colors.red : AppConst.borderGrey,
              size: value,
            ),
          ),
        ),
      ),
    );
  }
}
