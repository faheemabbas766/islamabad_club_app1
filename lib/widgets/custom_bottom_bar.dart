import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';

import 'confirm_box.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});
  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();

}

class CustomBottomBarState extends State<CustomBottomBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavhome,
      activeIcon: ImageConstant.imgNavhome,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCalendar,
      activeIcon: ImageConstant.imgCalendar,
      title: "Date",
      type: BottomBarEnum.Date,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgVuesaxlinearbookmark,
      activeIcon: ImageConstant.imgVuesaxlinearbookmark,
      title: "Task",
      type: BottomBarEnum.Task,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUserBlueGray400,
      activeIcon: ImageConstant.imgUserBlueGray400,
      title: "Profile",
      type: BottomBarEnum.ProfilePage,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              20,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              20,
            ),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black90002.withOpacity(0.06),
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex:
        Variables.AppButtonSelected,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          final isSelected = index ==
              Variables.AppButtonSelected;
          final menuModel = bottomMenuList[index];
          return BottomNavigationBarItem(
            icon: Container(
              padding: getPadding(
                left: 20,
                top: 4,
                right: 20,
                bottom: 4,
              ),
              decoration: AppDecoration.fill1.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder16,
              ),
              child: CustomImageView(
                svgPath: bottomMenuList[index].icon,
                height: getSize(
                  24,
                ),
                width: getSize(
                  24,
                ),
                color: appTheme.blueGray400,
                margin: getMargin(
                  top: 4,
                  bottom: 4,
                ),
              ),
            ),
            activeIcon: Container(
              padding: getPadding(
                left: 3,
                top: 4,
                right: 8,
                bottom: 4,
              ),
              decoration: AppDecoration.fill2.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    svgPath: isSelected ? menuModel.activeIcon : menuModel.icon,
                    height: getSize(24),
                    width: getSize(24),
                    color: isSelected ? theme.colorScheme.primary : appTheme.blueGray400,
                    margin: getMargin(top: 4, bottom: 4),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 4,
                      right: 8,
                    ),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            label: '',
          );
        }),
        onTap: (index) {
          setState(() {
            Variables.AppButtonSelected = index;
          });

          final selectedType = bottomMenuList[index].type;

          if (selectedType == BottomBarEnum.ProfilePage) {
            Navigator.pushNamed(context, AppRoutes.profilePage);
          } else if (selectedType == BottomBarEnum.Home) {
            while(Navigator.canPop(context)){
              Navigator.pop(context);
            }
            Navigator.pushNamed(context, AppRoutes.homeScreenContainerScreen);
          } else {
            widget.onChanged?.call(selectedType);
          }
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  ProfilePage,
  Task,
  Date
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
