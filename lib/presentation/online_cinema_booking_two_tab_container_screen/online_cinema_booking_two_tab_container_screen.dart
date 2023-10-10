
import '../online_cinema_booking_two_tab_container_screen/widgets/sliderbg_item_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/presentation/online_cinema_booking_two_page/online_cinema_booking_two_page.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import 'package:islamabad_club_app/widgets/custom_icon_button.dart';
import 'package:islamabad_club_app/widgets/custom_search_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnlineCinemaBookingTwoTabContainerScreen extends StatefulWidget {
  const OnlineCinemaBookingTwoTabContainerScreen({Key? key}) : super(key: key);

  @override
  OnlineCinemaBookingTwoTabContainerScreenState createState() =>
      OnlineCinemaBookingTwoTabContainerScreenState();
}

// ignore_for_file: must_be_immutable
class OnlineCinemaBookingTwoTabContainerScreenState
    extends State<OnlineCinemaBookingTwoTabContainerScreen>
    with TickerProviderStateMixin {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  TextEditingController searchController = TextEditingController();

  int sliderIndex = 1;

  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    
    notificationShow(context);
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor:
                theme.colorScheme.onPrimaryContainer.withOpacity(1),
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: getMargin(left: 24, right: 24),
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
                                    child: Text("Cinema Booking",
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
                      CustomSearchView(
                          margin: getMargin(left: 24, top: 14, right: 24),
                          controller: searchController,
                          hintText: "Search ",
                          hintStyle: CustomTextStyles.titleSmallBluegray400,
                          textStyle: CustomTextStyles.titleSmallBluegray400,
                          prefix: Container(
                              margin: getMargin(
                                  left: 12, top: 16, right: 10, bottom: 16),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgContrast)),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(52)),
                          suffix: Container(
                              margin: getMargin(
                                  left: 30, top: 16, right: 16, bottom: 16),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgSettings)),
                          suffixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(52)),
                          filled: true,
                          fillColor: theme.colorScheme.onPrimaryContainer
                              .withOpacity(1),
                          contentPadding: getPadding(top: 17, bottom: 17)),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: getPadding(top: 14),
                          child: IntrinsicWidth(
                              child: CarouselSlider.builder(
                                  options: CarouselOptions(
                                      height: getVerticalSize(154),
                                      initialPage: 0,
                                      autoPlay: true,
                                      viewportFraction: 1.0,
                                      enableInfiniteScroll: false,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (index, reason) {
                                        sliderIndex = index;
                                      }),
                                  itemCount: 3,
                                  itemBuilder: (context, index, realIndex) {
                                    return SliderbgItemWidget();
                                  }))),
                      Container(
                          height: getVerticalSize(8),
                          margin: getMargin(top: 12),
                          child: AnimatedSmoothIndicator(
                              activeIndex: 0,
                              count: 3,
                              effect: ScrollingDotsEffect(
                                  spacing: 8,
                                  activeDotColor: theme.colorScheme.primary,
                                  dotColor: theme.colorScheme.primary
                                      .withOpacity(0.47),
                                  dotHeight: getVerticalSize(8),
                                  dotWidth: getHorizontalSize(8)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 19, top: 15),
                              child: Text("Categories",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles
                                      .titleMediumBlack90002_1
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.12))))),
                      Container(
                          height: getVerticalSize(44),
                          width: getHorizontalSize(356),
                          margin: getMargin(top: 25),
                          decoration: BoxDecoration(
                              color: theme.colorScheme.onPrimaryContainer
                                  .withOpacity(1),
                              borderRadius:
                                  BorderRadius.circular(getHorizontalSize(9)),
                              border: Border.all(
                                  color: appTheme.gray200,
                                  width: getHorizontalSize(1)),
                              boxShadow: [
                                BoxShadow(
                                    color: theme.colorScheme.onPrimary,
                                    spreadRadius: getHorizontalSize(2),
                                    blurRadius: getHorizontalSize(2),
                                    offset: Offset(0, 7.55))
                              ]),
                          child: TabBar(
                              controller: tabviewController,
                              labelColor: appTheme.amber600,
                              labelStyle: TextStyle(),
                              unselectedLabelColor: appTheme.black90002,
                              unselectedLabelStyle: TextStyle(),
                              indicatorPadding: getPadding(all: 6.5),
                              indicator: BoxDecoration(
                                  color: appTheme.blueGray900,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(8))),
                              tabs: [
                                Tab(
                                    child: Text("All",
                                        overflow: TextOverflow.ellipsis)),
                                Tab(
                                    child: Text("Comedy",
                                        overflow: TextOverflow.ellipsis)),
                                Tab(
                                    child: Text("Animation",
                                        overflow: TextOverflow.ellipsis)),
                                Tab(
                                    child: Text("Documentary",
                                        overflow: TextOverflow.ellipsis))
                              ])),
                      SizedBox(
                          height: getVerticalSize(271),
                          child: TabBarView(
                              controller: tabviewController,
                              children: [
                                OnlineCinemaBookingTwoPage(),
                                OnlineCinemaBookingTwoPage(),
                                OnlineCinemaBookingTwoPage(),
                                OnlineCinemaBookingTwoPage()
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
  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
