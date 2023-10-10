import '../online_cinema_booking_two_page/widgets/listbg_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class OnlineCinemaBookingTwoPage extends StatefulWidget {
  const OnlineCinemaBookingTwoPage({Key? key})
      : super(
          key: key,
        );

  @override
  OnlineCinemaBookingTwoPageState createState() =>
      OnlineCinemaBookingTwoPageState();
}

class OnlineCinemaBookingTwoPageState extends State<OnlineCinemaBookingTwoPage>
    with AutomaticKeepAliveClientMixin<OnlineCinemaBookingTwoPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: getPadding(
                      left: 19,
                      top: 13,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            right: 29,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 4,
                                ),
                                child: Text(
                                  "Most popular",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles
                                      .titleMediumBlack90002_1
                                      .copyWith(
                                    letterSpacing: getHorizontalSize(
                                      0.12,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  bottom: 6,
                                ),
                                child: Text(
                                  "See All",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.titleSmallAmber600
                                      .copyWith(
                                    letterSpacing: getHorizontalSize(
                                      0.12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: AppDecoration.fill3.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder12,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                        height: getVerticalSize(
                                          178,
                                        ),
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (
                                            context,
                                            index,
                                          ) {
                                            return SizedBox(
                                              width: getHorizontalSize(
                                                12,
                                              ),
                                            );
                                          },
                                          itemCount: 2,
                                          itemBuilder: (context, index) {
                                            return ListbgItemWidget();
                                          },
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: getPadding(
                                          top: 12,
                                        ),
                                        child: Text(
                                          "Spider-Man No..",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: CustomTextStyles
                                              .titleSmallOnPrimaryContainerSemiBold
                                              .copyWith(
                                            letterSpacing: getHorizontalSize(
                                              0.12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 7,
                                        top: 1,
                                        bottom: 7,
                                      ),
                                      child: Text(
                                        "Action",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: theme.textTheme.labelMedium!
                                            .copyWith(
                                          letterSpacing: getHorizontalSize(
                                            0.12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: AppDecoration.fill3.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder12,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
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
                                            imagePath:
                                                ImageConstant.imgBg178x135,
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
                                              decoration:
                                                  AppDecoration.fill4.copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder8,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgStar,
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: theme
                                                          .textTheme.labelLarge!
                                                          .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
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
                                    Padding(
                                      padding: getPadding(
                                        left: 8,
                                        top: 11,
                                      ),
                                      child: Text(
                                        "Life of PI",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: CustomTextStyles
                                            .titleSmallOnPrimaryContainerSemiBold
                                            .copyWith(
                                          letterSpacing: getHorizontalSize(
                                            0.12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 7,
                                        top: 3,
                                        bottom: 7,
                                      ),
                                      child: Text(
                                        "Action",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: theme.textTheme.labelMedium!
                                            .copyWith(
                                          letterSpacing: getHorizontalSize(
                                            0.12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: IntrinsicWidth(
                                  child: Container(
                                    decoration: AppDecoration.fill3.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder12,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
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
                                                imagePath: ImageConstant.imgBg1,
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
                                                  decoration: AppDecoration
                                                      .fill4
                                                      .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder8,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgStarOrange600,
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
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: CustomTextStyles
                                                              .labelLargeOrange600
                                                              .copyWith(
                                                            letterSpacing:
                                                                getHorizontalSize(
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
                                        Padding(
                                          padding: getPadding(
                                            left: 8,
                                            top: 11,
                                          ),
                                          child: Text(
                                            "Riverdale",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: CustomTextStyles
                                                .titleSmallOnPrimaryContainerSemiBold
                                                .copyWith(
                                              letterSpacing: getHorizontalSize(
                                                0.12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 7,
                                            top: 3,
                                            bottom: 7,
                                          ),
                                          child: Text(
                                            "Action",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: theme.textTheme.labelMedium!
                                                .copyWith(
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
                              ),
                            ],
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
      ),
    );
  }
}
