import 'package:pj_demoflutterapp/res/color.dart';
import 'package:pj_demoflutterapp/res/style/text_style.dart';
import 'package:flutter/material.dart';

class HomeListTittleWidget extends StatelessWidget {
  final String text;
  const HomeListTittleWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppStyle.instance.h5Bold,
        ),
        Text("See all",
            style: AppStyle.instance.h5Bold.copyWith(
              color: AppColors.redColor,
            )),
      ],
    );
  }
}
