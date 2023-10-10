import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';

// ignore: must_be_immutable
class ListunsplashyhsItemWidget extends StatelessWidget {
  ListunsplashyhsItemWidget({
    Key? key,
    this.onTapWelcome,
  }) : super(
          key: key,
        );

  VoidCallback? onTapWelcome;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(
        152,
      ),
      child: GestureDetector(
        onTap: () {
          onTapWelcome?.call();
        },
        child: Container(
          decoration: AppDecoration.outline11.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgUnsplashyhswy6uqvk,
                height: getVerticalSize(
                  72,
                ),
                width: getHorizontalSize(
                  152,
                ),
                radius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getHorizontalSize(
                      7,
                    ),
                  ),
                  topRight: Radius.circular(
                    getHorizontalSize(
                      7,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 8,
                  top: 10,
                ),
                child: Text(
                  "",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.labelSmall,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    top: 3,
                    bottom: 11,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 5,
                          bottom: 4,
                        ),
                        child: Text(
                          "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style:
                              CustomTextStyles.redHatDisplayBlack900.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.15,
                            ),
                          ),
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgCart,
                        height: getVerticalSize(
                          20,
                        ),
                        width: getHorizontalSize(
                          22,
                        ),
                        margin: getMargin(
                          left: 75,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
