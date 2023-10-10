import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';

// ignore: must_be_immutable
class AppbarStack1 extends StatelessWidget {
  AppbarStack1({
    Key? key,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.pushNamed(
            context, AppRoutes.notificationScreen);
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: appTheme.gray200,
              width: getHorizontalSize(
                1,
              ),
            ),
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Container(
            height: getSize(
              40,
            ),
            width: getSize(
              40,
            ),
            padding: getPadding(
              all: 8,
            ),
            decoration: AppDecoration.outline.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgNotification,
                  height: getSize(
                    24,
                  ),
                  width: getSize(
                    24,
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: getSize(
                      8,
                    ),
                    width: getSize(
                      8,
                    ),
                    margin: getMargin(
                      left: 13,
                      top: 1,
                      right: 3,
                      bottom: 15,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          4,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
