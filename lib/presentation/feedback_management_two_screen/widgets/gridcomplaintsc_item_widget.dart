import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';

// ignore: must_be_immutable
class GridcomplaintscItemWidget extends StatelessWidget {
  const GridcomplaintscItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        top: 7,
        right: 10,
        bottom: 7,
      ),
      decoration: AppDecoration.outline15.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Container(
        width: getHorizontalSize(
          95,
        ),
        margin: getMargin(
          top: 11,
        ),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "131",
                style: CustomTextStyles.displaySmallPrimary,
              ),
              TextSpan(
                text: "",
                style: CustomTextStyles.titleLargeRedHatDisplay,
              ),
              TextSpan(
                text: "Complaints",
                style: CustomTextStyles.titleSmallSemiBold_1,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
