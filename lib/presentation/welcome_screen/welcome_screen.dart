import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/widgets/custom_elevated_button.dart';
import 'package:islamabad_club_app/widgets/custom_outlined_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();
  @override
  Widget build(BuildContext context) {
    notificationShow(context);
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(
                0.56,
                0.32,
              ),
              end: Alignment(
                0.5,
                0.79,
              ),
              colors: [
                theme.colorScheme.secondaryContainer,
                appTheme.black90002.withOpacity(0.59),
              ],
            ),
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgWelcomescreen,
              ),
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), // Adjust opacity (0.5 in this case)
                BlendMode.darken,
              ),
              fit: BoxFit.cover,
            ),
            color: Color.fromRGBO(238, 228, 228, 0.5019607843137255),
          ),
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 22,
              right: 22,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height/2.3,
                ),
                Container(
                  width: getHorizontalSize(
                    254,
                  ),
                  margin: getMargin(
                    right: 75,
                  ),
                  child: Text(
                    "Welcome to \nIslamabad\nClub",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.displayMedium,
                  ),
                ),
                Container(
                  width: getHorizontalSize(
                    287,
                  ),
                  margin: getMargin(
                    top: 17,
                    right: 41,
                  ),
                  child: Text(
                    "Islamabad Club was established in the year 1967 to provide recreational and sports facilities",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 22,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          width: double.maxFinite,
                          height: getVerticalSize(
                            50,
                          ),
                          text: "Sign Up",
                          margin: getMargin(
                            right: 5,
                          ),
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.signUpScreen);
                          },
                          buttonStyle: CustomButtonStyles.fillPrimary,
                          buttonTextStyle: CustomTextStyles
                              .titleMediumOnPrimaryContainerMedium,
                        ),
                      ),
                      Expanded(
                        child: CustomOutlinedButton(
                          width: double.maxFinite,
                          height: getVerticalSize(
                            50,
                          ),
                          text: "Log In",
                          margin: getMargin(
                            left: 5,
                          ),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, AppRoutes.logInScreen);
                          },
                          buttonStyle: CustomButtonStyles.outlineAmber600,
                          buttonTextStyle: CustomTextStyles
                              .titleMediumOnPrimaryContainerMedium,
                        ),
                      ),
                    ],
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
