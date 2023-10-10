import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';

// ignore: must_be_immutable
class ListbgItemWidget extends StatelessWidget {
  const ListbgItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(
        135,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          height: getVerticalSize(
            178,
          ),
          width: getHorizontalSize(
            135,
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgBg,
                height: getVerticalSize(
                  178,
                ),
                width: getHorizontalSize(
                  135,
                ),
                radius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getHorizontalSize(
                      12,
                    ),
                  ),
                  topRight: Radius.circular(
                    getHorizontalSize(
                      12,
                    ),
                  ),
                ),
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: getMargin(
                    left: 72,
                    top: 8,
                    right: 8,
                    bottom: 146,
                  ),
                  padding: getPadding(
                    left: 8,
                    top: 4,
                    right: 8,
                    bottom: 4,
                  ),
                  decoration: AppDecoration.fill4.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgStar,
                        height: getSize(
                          16,
                        ),
                        width: getSize(
                          16,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 4,
                        ),
                        child: Text(
                          "4.5",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.labelLarge!.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.12,
                            ),
                          ),
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
