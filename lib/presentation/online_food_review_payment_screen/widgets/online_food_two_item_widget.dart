import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class OnlineFoodTwoItemWidget extends StatelessWidget {
  const OnlineFoodTwoItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 14,
        top: 10,
        right: 14,
        bottom: 10,
      ),
      decoration: AppDecoration.outline13.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgFoodimage,
            height: getSize(
              74,
            ),
            width: getSize(
              74,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                4,
              ),
            ),
            margin: getMargin(
              top: 3,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 14,
              top: 16,
              bottom: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: CustomTextStyles.titleMediumRedHatDisplayBlack900,
                ),
                Padding(
                  padding: getPadding(
                    top: 4,
                  ),
                  child: Text(
                    "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.titleSmallRedHatDisplayGray50001
                        .copyWith(
                      letterSpacing: getHorizontalSize(
                        0.29,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: getPadding(
              top: 1,
              right: 1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgVolumePrimary,
                  height: getSize(
                    22,
                  ),
                  width: getSize(
                    22,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 7,
                  ),
                  child: Text(
                    "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.labelLargeRedHatDisplayBlack900
                        .copyWith(
                      letterSpacing: getHorizontalSize(
                        0.26,
                      ),
                    ),
                  ),
                ),
                CustomIconButton(
                  height: 22,
                  width: 22,
                  margin: getMargin(
                    top: 7,
                  ),
                  padding: getPadding(
                    all: 7,
                  ),
                  decoration: IconButtonStyleHelper.fillPrimary,
                  child: CustomImageView(
                    svgPath: ImageConstant.imgPlusOnprimarycontainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
