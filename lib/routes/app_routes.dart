import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:islamabad_club_app/presentation/cancel_cinema_ticket_screen/cancel_cinema_ticket_screen.dart';
import 'package:islamabad_club_app/presentation/feedback_management_main_screen/feedback_management_main_screen.dart';
import 'package:islamabad_club_app/presentation/feedback_management_search_result_screen/feedback_management_search_result_screen.dart';
import 'package:islamabad_club_app/presentation/feedback_management_suggestion_screen/feedback_management_suggestion_screen.dart';
import 'package:islamabad_club_app/presentation/forget_password_screen/change_password_screen.dart';
import 'package:islamabad_club_app/presentation/forget_password_screen/forget_password_screen.dart';
import 'package:islamabad_club_app/presentation/online_cinema_booking_main_screen/online_cinema_booking_main_screen.dart';
import 'package:islamabad_club_app/presentation/online_cinema_final_ticket_screen/final_ticket_screen.dart';
import 'package:islamabad_club_app/presentation/online_cinema_opening_screen/online_cinema_opening_screen.dart';
import 'package:islamabad_club_app/presentation/splash_screen/splash_screen.dart';
import 'package:islamabad_club_app/presentation/welcome_screen/welcome_screen.dart';
import 'package:islamabad_club_app/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:islamabad_club_app/presentation/log_in_screen/log_in_screen.dart';
import 'package:islamabad_club_app/presentation/home_screen_container_screen/home_screen_container_screen.dart';
import 'package:islamabad_club_app/presentation/member_portal_six_screen/member_portal_six_screen.dart';
import 'package:islamabad_club_app/presentation/member_portal_one_screen/member_portal_one_screen.dart';
import 'package:islamabad_club_app/presentation/member_portal_five_screen/member_portal_five_screen.dart';
import 'package:islamabad_club_app/presentation/member_portal_four_screen/member_portal_four_screen.dart';
import 'package:islamabad_club_app/presentation/online_food_screen/online_food_screen.dart';
import 'package:islamabad_club_app/presentation/feedback_management_screen/feedback_management_screen.dart';
import 'package:islamabad_club_app/presentation/feedback_management_one_screen/feedback_management_one_screen.dart';
import 'package:islamabad_club_app/presentation/feedback_management_two_screen/feedback_management_two_screen.dart';
import 'package:islamabad_club_app/presentation/online_cinema_booking_two_tab_container_screen/online_cinema_booking_two_tab_container_screen.dart';
import 'package:islamabad_club_app/presentation/online_cinema_booking_screen/online_cinema_booking_screen.dart';
import 'package:islamabad_club_app/presentation/online_cinema_booking_one_screen/online_cinema_booking_one_screen.dart';
import 'package:islamabad_club_app/presentation/app_navigation_screen/app_navigation_screen.dart';
import '../notification_services.dart';
import '../presentation/member_portal_online_payment_screen/member_portal_three_screen.dart';
import '../presentation/member_portal_online_payment_screen/online_confirm_payment_screen.dart';
import '../presentation/member_portal_online_payment_screen/payment_method_screen.dart';
import '../presentation/member_portal_profile_input_screen/member_portal_screen.dart';
import '../presentation/member_portal_screen/member_portal_two_screen.dart';
import '../presentation/notification_details_screen/notification_details_screen.dart';
import '../presentation/notification_screen/notification.dart';
import '../presentation/online_food_cart_screen/online_food_cart_screen.dart';
import '../presentation/online_food_checkout_screen/online_food_four_screen.dart';
import '../presentation/online_food_details_screen/online_food_three_screen.dart';
import '../presentation/online_food_review_payment_screen/online_food_two_screen.dart';
import '../presentation/profile_page/profile_page.dart';
import '../presentation/online_cinema_seats_screen/online_cinema_seats_screen.dart';
class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String changePasswordScreen = '/change_password_screen';

  static const String forgetPasswordScreen = '/forget_password_screen';

  static const String welcomeScreen = '/welcome_screen';

  static const String notificationScreen = '/notification_screen';

  static const String notificationDetailsScreen = '/notification_details_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String logInScreen = '/log_in_screen';

  static const String homeScreenPage = '/home_screen_page';

  static const String homeScreenContainerScreen = '/home_screen_container_screen';

  static const String profilePage = '/profile_page';

  static const String memberPortalScreen = '/member_portal_two_screen';

  static const String memberPortalProfileInputScreen = '/member_portal_screen';

  static const String memberPortalFamilyInfoScreen = '/member_portal_six_screen';

  static const String memberPortalBillingMethod = '/member_portal_one_screen';

  static const String memberPortalBillingMethodNext = '/payment_method_screen';

  static const String memberPortalStatementOfAccountScreen = '/member_portal_five_screen';

  static const String memberPortalRoomReservationScreen = '/member_portal_four_screen';

  static const String memberPortalOnlinePaymentScreen = '/member_portal_three_screen';

  static const String memberPortalOnlineConfirmPaymentScreen = '/online_confirm_payment_screen';

  static const String memberPortalOnlinePaymentMethodScreen = '/payment_method_screen';

  static const String onlineFoodScreen = '/online_food_screen';

  static const String onlineFoodDetailsScreen = '/online_food_details_screen';

  static const String onlineFoodCartScreen = '/online_food_cart_screen';

  static const String onlineFoodReviewPaymentScreen = '/online_food_review_payment_screen';

  static const String onlineFoodCheckOutScreen = '/online_food_checkout_screen';

  static const String feedbackManagementScreen = '/feedback_management_screen';

  static const String feedbackManagementSearchComplaintScreen = '/feedback_management_one_screen';

  static const String feedbackManagementTwoScreen = '/feedback_management_two_screen';

  static const String onlineCinemaBookingTwoPage = '/online_cinema_booking_two_page';

  static const String onlineCinemaBookingTwoTabContainerScreen = '/online_cinema_booking_two_tab_container_screen';

  static const String onlineCinemaBookingDetailsScreen = '/online_cinema_booking_screen';

  static const String onlineCinemaBookingOneScreen = '/online_cinema_booking_one_screen';

  static const String onlineCinemaOpeningScreen = '/online_cinema_opening_screen';

  static const String onlineCinemaSeatsScreen = '/online_cinema_seats_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String onlineCinemaBookingFinalTicketScreen = '/online_cinema_final_ticket_screen';

  static const String onlineCinemaBookingMainScreen = '/online_cinema_booking_main_screen';

  static const String cancelTicketsScreen = '/cancel_cinema_ticket_screen';

  static const String feedbackManagementMainScreen = '/feedback_management_main_screen';

  static const String feedbackManagementSuggestionScreen = '/feedback_management_suggestion_screen';

  static const String feedbackManagementSearchResultScreen = '/feedback_management_search_result_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    welcomeScreen: (context) => WelcomeScreen(),
    signUpScreen: (context) => SignUpScreen(),
    logInScreen: (context) => LogInScreen(),
    profilePage: (context) => ProfilePage(),
    homeScreenContainerScreen: (context) => HomeScreenContainerScreen(),
    memberPortalScreen: (context) => MemberPortalTwoScreen(),
    memberPortalProfileInputScreen: (context) => MemberPortalScreen(),
    memberPortalFamilyInfoScreen: (context) => MemberPortalSixScreen(),
    memberPortalBillingMethod: (context) => MemberPortalOneScreen(),
    memberPortalStatementOfAccountScreen: (context) => MemberPortalFiveScreen(),
    memberPortalRoomReservationScreen: (context) => MemberPortalFourScreen(),
    memberPortalOnlinePaymentScreen: (context) => MemberPortalThreeScreen(),
    memberPortalOnlineConfirmPaymentScreen: (context) => ConfirmPaymentScreen(),
    onlineFoodScreen: (context) => OnlineFoodScreen(),
    onlineFoodDetailsScreen: (context) => OnlineFoodThreeScreen(),
    onlineFoodCartScreen: (context) => OnlineFoodOneScreen(),
    onlineFoodReviewPaymentScreen: (context) => OnlineFoodTwoScreen(),
    onlineFoodCheckOutScreen: (context) => OnlineFoodFourScreen(),
    feedbackManagementScreen: (context) => FeedbackManagementScreen(),
    feedbackManagementSearchComplaintScreen: (context) => FeedbackManagementOneScreen(),
    feedbackManagementTwoScreen: (context) => FeedbackManagementTwoScreen(),
    onlineCinemaBookingTwoTabContainerScreen: (context) => OnlineCinemaBookingTwoTabContainerScreen(),
    onlineCinemaBookingDetailsScreen: (context) => OnlineCinemaBookingDetailsScreen(),
    onlineCinemaBookingOneScreen: (context) => OnlineCinemaBookingOneScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    notificationDetailsScreen: (context) => NotificationDetailsScreen(),
    notificationScreen: (context) => NotificationScreen(),
    forgetPasswordScreen: (context) => ForgetPasswordScreen(),
    changePasswordScreen: (context) => ChangePasswordScreen(),
    memberPortalBillingMethodNext: (context) => PaymentMethod(),
    onlineCinemaOpeningScreen: (context) => OnlineCinemaOpeningScreen(),
    onlineCinemaSeatsScreen: (context) => SeatsScreen(),
    onlineCinemaBookingFinalTicketScreen: (context) => FinalTicketScreen(),
    onlineCinemaBookingMainScreen: (context) => OnlineCinemaBookingMainScreen(),
    cancelTicketsScreen: (context) => CancelTicketScreen(),
    feedbackManagementMainScreen: (context) => FeedbackManagementMainScreen(),
    feedbackManagementSuggestionScreen: (context) => FeedbackManagementSuggestionScreen(),
    feedbackManagementSearchResultScreen: (context) => FeedbackManagementSearchResultScreen(),


  };
}


NotificationServices notificationServices = NotificationServices();
void notificationShow(BuildContext context){
  notificationServices.requestNotificationPermission();
  notificationServices.forGroundMessage();
  notificationServices.firebaseInit(context);
  notificationServices.setupInteractMessage(context);
  notificationServices.isTokenRefresh();
  notificationServices.getDeviceToken().then((value){
    if (kDebugMode) {
      print('device token');
      print(value);
    }
  });
}