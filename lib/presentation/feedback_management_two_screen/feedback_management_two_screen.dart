
import '../feedback_management_two_screen/widgets/gridcomplaintsc_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import 'package:islamabad_club_app/widgets/custom_checkbox_button.dart';
import 'package:islamabad_club_app/widgets/custom_icon_button.dart';
class FeedbackManagementTwoScreen extends StatelessWidget {
  FeedbackManagementTwoScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  bool isCheckbox = false;

  bool isCheckbox1 = false;

  @override
  Widget build(BuildContext context) {
    
    notificationShow(context);
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor:
                theme.colorScheme.onPrimaryContainer.withOpacity(1),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, right: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: getPadding(top: 11, bottom: 11),
                          decoration: AppDecoration.fill1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomIconButton(
                                    height: 40,
                                    width: 40,
                                    padding: getPadding(all: 8),
                                    onTap: () {
                                      onTapBtnArrowleft(context);
                                    },
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgArrowleft)),
                                Padding(
                                    padding: getPadding(top: 11, bottom: 8),
                                    child: Text("Feedback Management",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: theme.textTheme.titleMedium)),
                                Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: appTheme.gray200,
                                            width: getHorizontalSize(1)),
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder8),
                                    child: Container(
                                        height: getSize(40),
                                        width: getSize(40),
                                        padding: getPadding(all: 8),
                                        decoration: AppDecoration.outline
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder8),
                                        child: Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgNotification,
                                                  height: getSize(24),
                                                  width: getSize(24),
                                                  alignment: Alignment.center),
                                              Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                      height: getSize(8),
                                                      width: getSize(8),
                                                      margin: getMargin(
                                                          top: 1, right: 3),
                                                      decoration: BoxDecoration(
                                                          color: theme
                                                              .colorScheme
                                                              .primary,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      4)))))
                                            ])))
                              ])),
                      Expanded(
                          child: Padding(
                              padding: getPadding(top: 42),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: getVerticalSize(85),
                                          crossAxisCount: 2,
                                          mainAxisSpacing:
                                              getHorizontalSize(23),
                                          crossAxisSpacing:
                                              getHorizontalSize(23)),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return GridcomplaintscItemWidget();
                                  }))),
                      Container(
                          height: getVerticalSize(246),
                          width: getHorizontalSize(318),
                          margin: getMargin(top: 52, bottom: 5),
                          child: Stack(alignment: Alignment.center, children: [
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    height: getVerticalSize(37),
                                    width: getHorizontalSize(6),
                                    margin: getMargin(right: 34, bottom: 53),
                                    decoration: BoxDecoration(
                                        color: appTheme.lightGreen400))),
                            Align(
                                alignment: Alignment.center,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: getPadding(bottom: 16),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("10",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: theme.textTheme
                                                              .bodySmall),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 10),
                                                          child: Text("8.75",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall)),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 10),
                                                          child: Text("7.5",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall)),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 9),
                                                          child: Text("6.25",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall)),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 10),
                                                          child: Text("5",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall)),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 10),
                                                          child: Text("3.75",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall)),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 10),
                                                          child: Text("2.5",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall)),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 10),
                                                          child: Text("1.25",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall)),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 9),
                                                          child: Text("0",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall))
                                                    ])),
                                            Expanded(
                                                child: Padding(
                                                    padding: getPadding(
                                                        left: 8, top: 9),
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                              width:
                                                                  getHorizontalSize(
                                                                      289),
                                                              padding:
                                                                  getPadding(
                                                                      left: 3,
                                                                      top: 1,
                                                                      right: 3,
                                                                      bottom:
                                                                          1),
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: fs.Svg(
                                                                          ImageConstant
                                                                              .imgGroup177),
                                                                      fit: BoxFit
                                                                          .cover)),
                                                              child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            88),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            top:
                                                                                87),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.red500)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            57),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            left:
                                                                                1,
                                                                            top:
                                                                                119),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.lightGreen400)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            70),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            left:
                                                                                7,
                                                                            top:
                                                                                106),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.red500)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            77),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            left:
                                                                                1,
                                                                            top:
                                                                                99),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.lightGreen400)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            53),
                                                                        width: getHorizontalSize(
                                                                            6),
                                                                        margin: getMargin(
                                                                            left:
                                                                                9,
                                                                            top:
                                                                                123),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.red500)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            62),
                                                                        width: getHorizontalSize(
                                                                            6),
                                                                        margin: getMargin(
                                                                            left:
                                                                                1,
                                                                            top:
                                                                                114),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.lightGreen400)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            123),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            left:
                                                                                9,
                                                                            top:
                                                                                53),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.red500)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            88),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            left:
                                                                                1,
                                                                            top:
                                                                                87),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.lightGreen400)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            87),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            left:
                                                                                8,
                                                                            top:
                                                                                88),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.red500)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            134),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            left:
                                                                                1,
                                                                            top:
                                                                                42),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.lightGreen400)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            176),
                                                                        width: getHorizontalSize(
                                                                            6),
                                                                        margin: getMargin(
                                                                            left:
                                                                                9),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.red500)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            79),
                                                                        width: getHorizontalSize(
                                                                            6),
                                                                        margin: getMargin(
                                                                            left:
                                                                                1,
                                                                            top:
                                                                                97),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.lightGreen400)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            53),
                                                                        width: getHorizontalSize(
                                                                            6),
                                                                        margin: getMargin(
                                                                            left:
                                                                                10,
                                                                            top:
                                                                                123),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.red500)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            102),
                                                                        width: getHorizontalSize(
                                                                            6),
                                                                        margin: getMargin(
                                                                            left:
                                                                                1,
                                                                            top:
                                                                                73),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.lightGreen400)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            70),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            left:
                                                                                9,
                                                                            top:
                                                                                106),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.red500)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            115),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            left:
                                                                                1,
                                                                            top:
                                                                                61),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.lightGreen400)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            141),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            left:
                                                                                8,
                                                                            top:
                                                                                35),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.red500)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            120),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            left:
                                                                                1,
                                                                            top:
                                                                                56),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.lightGreen400)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            176),
                                                                        width: getHorizontalSize(
                                                                            6),
                                                                        margin: getMargin(
                                                                            left:
                                                                                9),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.red500)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            66),
                                                                        width: getHorizontalSize(
                                                                            6),
                                                                        margin: getMargin(
                                                                            left:
                                                                                1,
                                                                            top:
                                                                                110),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.lightGreen400)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            106),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            left:
                                                                                9,
                                                                            top:
                                                                                70),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.red500)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            55),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            left:
                                                                                1,
                                                                            top:
                                                                                121),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.lightGreen400)),
                                                                    Container(
                                                                        height: getVerticalSize(
                                                                            141),
                                                                        width: getHorizontalSize(
                                                                            7),
                                                                        margin: getMargin(
                                                                            left:
                                                                                6,
                                                                            top:
                                                                                35,
                                                                            right:
                                                                                7),
                                                                        decoration:
                                                                            BoxDecoration(color: appTheme.red500))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 4),
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text("Jan",
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: theme
                                                                            .textTheme
                                                                            .bodySmall),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                5),
                                                                        child: Text(
                                                                            "Feb",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                7),
                                                                        child: Text(
                                                                            "Mar",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                6,
                                                                            top:
                                                                                1),
                                                                        child: Text(
                                                                            "Apr",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                8,
                                                                            bottom:
                                                                                1),
                                                                        child: Text(
                                                                            "Mai",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                8,
                                                                            bottom:
                                                                                1),
                                                                        child: Text(
                                                                            "Jun",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                8,
                                                                            bottom:
                                                                                1),
                                                                        child: Text(
                                                                            "Jul",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                11,
                                                                            top:
                                                                                1),
                                                                        child: Text(
                                                                            "Aug",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                6),
                                                                        child: Text(
                                                                            "Sep",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                6,
                                                                            bottom:
                                                                                1),
                                                                        child: Text(
                                                                            "Oct",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                8),
                                                                        child: Text(
                                                                            "Nov",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            left:
                                                                                6),
                                                                        child: Text(
                                                                            "Dec",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: theme.textTheme.bodySmall))
                                                                  ]))
                                                        ])))
                                          ]),
                                      Padding(
                                          padding: getPadding(top: 27),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomCheckboxButton(
                                                    text: "Completed",
                                                    iconSize:
                                                        getHorizontalSize(12),
                                                    value: isCheckbox,
                                                    textStyle: CustomTextStyles
                                                        .labelSmallInterBlack90002,
                                                    onChange: (value) {
                                                      isCheckbox = value;
                                                    }),
                                                CustomCheckboxButton(
                                                    text: "In Progress",
                                                    iconSize:
                                                        getHorizontalSize(12),
                                                    value: isCheckbox1,
                                                    margin: getMargin(left: 29),
                                                    textStyle: CustomTextStyles
                                                        .labelSmallInterBlack90002,
                                                    onChange: (value) {
                                                      isCheckbox1 = value;
                                                    })
                                              ]))
                                    ]))
                          ]))
                    ])),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Navigator.pushReplacementNamed(
                  navigatorKey.currentContext!, getCurrentRoute(type));
            })));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeScreenPage:
        return HomeScreenPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
