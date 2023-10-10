import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';

class MemberPortalItemWidget extends StatelessWidget {
  MemberPortalItemWidget(this.context, this.index);

  late int index;
  late final BuildContext context;

  Future<void> _onTap() async {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, AppRoutes.memberPortalProfileInputScreen);
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.memberPortalFamilyInfoScreen);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.memberPortalBillingMethod);
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.memberPortalStatementOfAccountScreen);
        break;
      case 4:
        Navigator.pushNamed(context, AppRoutes.memberPortalOnlinePaymentScreen);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: getPadding(
          left: 20,
          top: 23,
          right: 20,
          bottom: 23,
        ),
        decoration: AppDecoration.outline4.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Row(
          children: [
            CustomImageView(
              svgPath: getIconPath(index),
              height: getSize(24),
              width: getSize(24),
            ),
            Padding(
              padding: getPadding(left: 14, top: 3, bottom: 2),
              child: Text(
                getTitle(index),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: theme.textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getIconPath(int index) {
    switch (index) {
      case 0:
        return ImageConstant.userSvg;
      case 1:
        return ImageConstant.imgUser;
      case 2:
        return ImageConstant.imgVuesaxlinearbookmark;
      case 3:
        return ImageConstant.imgMenu;
      case 4:
        return ImageConstant.imgBillSvg;
      default:
        return "";
    }
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return "Profile";
      case 1:
        return "Family Info";
      case 2:
        return "Monthly Bills";
      case 3:
        return "Statement of Accounts";
      case 4:
        return "Online Bill Payment";
      default:
        return "";
    }
  }
}
