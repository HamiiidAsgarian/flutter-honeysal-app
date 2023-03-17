import 'package:flutter/material.dart';
import '../../consts.dart';

class TitleAndAll extends StatelessWidget {
  final String title;
  final Function onPressAll;
  const TitleAndAll({
    Key? key,
    required this.title,
    required this.onPressAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1.0),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Transform.scale(
                  scale: value,
                  child: Text(title, style: AppConst.sectionTitleStyle)),
            ),
            TextButton(
                onPressed: () {
                  onPressAll();
                },
                child: Container(
                  child: Transform.scale(
                    scale: value,
                    child: Text("View All",
                        style: AppConst.chipTextStyle.copyWith(
                          color: AppConst.burnedOrange,
                        )),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
