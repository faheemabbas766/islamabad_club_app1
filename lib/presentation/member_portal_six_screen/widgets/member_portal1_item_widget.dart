import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';

// ignore: must_be_immutable
class MemberPortal1ItemWidget extends StatelessWidget {
  const MemberPortal1ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(
        61,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "ABC",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: CustomTextStyles.montserratGray900.copyWith(
                letterSpacing: getHorizontalSize(
                  0.03,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 11,
              ),
              child: Text(
                "434",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: CustomTextStyles.dMSansBlack90002.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.03,
                  ),
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 9,
              ),
              child: Text(
                "343",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: CustomTextStyles.dMSansBlack90002.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.03,
                  ),
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 11,
              ),
              child: Text(
                "44",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: CustomTextStyles.dMSansBlack90002.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.03,
                  ),
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 11,
              ),
              child: Text(
                "434",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: CustomTextStyles.dMSansBlack90002.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.03,
                  ),
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 11,
              ),
              child: Text(
                "34",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: CustomTextStyles.dMSansBlack90002.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.03,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
