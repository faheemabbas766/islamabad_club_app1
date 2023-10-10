import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';

// ignore: must_be_immutable
class SliderbgItemWidget extends StatelessWidget {
  const SliderbgItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgBg138x295,
      height: getVerticalSize(
        138,
      ),
      width: getHorizontalSize(
        295,
      ),
      radius: BorderRadius.circular(
        getHorizontalSize(
          16,
        ),
      ),
      margin: getMargin(
        top: 8,
        right: 614,
        bottom: 8,
      ),
    );
  }
}
