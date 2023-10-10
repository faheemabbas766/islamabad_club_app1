import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';



class PaymentMethod extends StatefulWidget {
  PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  late MediaQueryData mediaQueryData;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  String? date;
  String? selectedCountry;
  String? selectedState;
  List<String> countryList= ['abc,abc'];
  List<String> stateList = [''];
  bool loaded = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    notificationShow(context);
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        resizeToAvoidBottomInset: false,
        body: Image(
          image: AssetImage('assets/images/image.png'), // Replace with your image's actual asset path
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Navigator.pushNamed(
              navigatorKey.currentContext!,
              getCurrentRoute(type),
            );
          },
        ),
      )
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenPage;
      default:
        return "/";
    }
  }

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