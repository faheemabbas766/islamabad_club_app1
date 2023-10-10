import 'package:islamabad_club_app/model/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';
import '../../model/services/media_service.dart';
import 'package:fluttertoast/fluttertoast.dart' as ft;

import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/presentation/home_screen_page/home_screen_page.dart';
import 'package:islamabad_club_app/widgets/custom_bottom_bar.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
class OnlineFoodScreen extends StatefulWidget {
  @override
  _OnlineFoodScreenState createState() => _OnlineFoodScreenState();
}
class _OnlineFoodScreenState extends State<OnlineFoodScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  TextEditingController inputController = TextEditingController();
  String selectedItem = "0";
  List<dynamic> categories = [];
  List<dynamic> allItems = [];
  bool isLoading = true;


  MediaService mediaService = MediaService();

  @override
  void initState() {
    super.initState();
    fatchData();
  }
  Future<void> fatchData()async {
    allCat();
    await loadItem(selectedItem);
    setState(() {
      isLoading = false;
    });
  }
  Future<void> allCat() async {
    try{
      dynamic response = await mediaService.postRequest('alliteamcatagory', "");
      print("Response Map: $response");  // Print the entire response map
      print("Status: ${response['status']}");
      if (response['status'] == 'Success') {
        categories = response['data'];
        setState(() {

        });

      }else{

        ft.Fluttertoast.showToast(
          msg: response['message'],
          toastLength: ft.Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: ft.Toast.LENGTH_SHORT,
      );
    }
  }
  Future<void> loadItem(String item) async {
    try{
      Map<String, dynamic> requestBody = {
        'FIC_SN': item,
        'FI_DELIVERABLE': Provider.of<ShoppingCartProvider>(context, listen: false).isDeliverable,
      };
      dynamic response = await mediaService.postRequest('food_item', requestBody);
      print("Response Map: $response");  // Print the entire response map
      print("Status: ${response['status']}");
      if (response['status'] == 'Success') {
        allItems = response['data'];
        setState(() {

        });

      }else{

        ft.Fluttertoast.showToast(
          msg: response['message'],
          toastLength: ft.Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: ft.Toast.LENGTH_SHORT,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    notificationShow(context);
    onTapArrowleft(BuildContext context) {
      while(Navigator.canPop(context))
        Navigator.pop(context);
      Navigator.pushNamed(context, AppRoutes.homeScreenContainerScreen);
    }
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            appBar: CustomAppBar(
                height: getVerticalSize(59),
                leadingWidth: 64,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 8, bottom: 8),
                    onTap: () {
                      onTapArrowleft(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "Online Foods"),
                actions: [
                  AppbarStack1(
                      margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
                ]),
            resizeToAvoidBottomInset: false,
            body: isLoading
                ? Center(
              child: CircularProgressIndicator(), // Show indicator while loading
            )
                : Stack(
              children: [
                Container(
                    padding: getPadding(left: 20, right: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              height: getVerticalSize(48),
                              width: getHorizontalSize(327),
                              margin: getMargin(top: 24),
                              child: Stack(alignment: Alignment.center, children: [
                                CustomImageView(
                                    svgPath:
                                    ImageConstant.imgSettingsOnprimarycontainer,
                                    height: getSize(29),
                                    width: getSize(29),
                                    alignment: Alignment.topRight,
                                    margin: getMargin(top: 6, right: 16)),
                                DropdownButtonFormField<String>(
                                  value: Provider.of<ShoppingCartProvider>(context, listen: false).isDeliverable,
                                  onChanged: (newValue) {
                                    setState(() {
                                      var shoppingCartProvider = Provider.of<ShoppingCartProvider>(context, listen: false);
                                      shoppingCartProvider.cart.items = [];
                                      shoppingCartProvider.cart.type = newValue!;
                                      Provider.of<ShoppingCartProvider>(context, listen: false).changeType(newValue);
                                      isLoading = true;
                                      fatchData();
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: "N",
                                      child: Text("Take Away"),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: "Y",
                                      child: Text("Delivery"),
                                    ),
                                  ],
                                ),
                              ])),
                          Expanded(
                            child: Container(
                                width: getHorizontalSize(327),
                                margin: getMargin(top: 24),
                                child: Stack(alignment: Alignment.center, children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                          height: getVerticalSize(138),
                                          width: getHorizontalSize(151),
                                          margin: getMargin(top: 127),
                                          decoration: BoxDecoration(
                                              color: theme
                                                  .colorScheme.onPrimaryContainer
                                                  .withOpacity(1),
                                              borderRadius: BorderRadius.circular(
                                                  getHorizontalSize(7))))),
                                  SizedBox(
                                      width: double.maxFinite,
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                              children: [
                                                SizedBox(
                                                    height: getVerticalSize(40),
                                                    child: ListView.separated(
                                                      scrollDirection: Axis.horizontal,
                                                      separatorBuilder: (context, index) {
                                                        return SizedBox(width: 10);
                                                      },
                                                      itemCount: categories.length,
                                                      itemBuilder: (context, index) {
                                                        return InkWell(
                                                          onTap: (){
                                                            loadItem(categories[index]['FIC_SN']?? "");
                                                            selectedItem = categories[index]['FIC_SN']?? "";
                                                            setState(() {
                                                            });
                                                          },
                                                          child:Container(
                                                            decoration: selectedItem == categories[index]['FIC_SN']
                                                                ? BoxDecoration(
                                                              borderRadius: BorderRadius.circular(10),
                                                              color: Colors.amber,
                                                            )
                                                                : BoxDecoration(
                                                              border: Border.all(color: Colors.grey),
                                                              borderRadius: BorderRadius.circular(10),
                                                            ),
                                                            width: 100,
                                                            height: 20,
                                                            child: Center(
                                                              child: Text(
                                                                categories[index]['FIC_CAT'],
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(fontSize: 14),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    )
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                Expanded(
                                                  child: GridView.builder(
                                                    padding: getPadding(top: 13),
                                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: getHorizontalSize(15),
                                                      mainAxisSpacing: getVerticalSize(15),
                                                    ),
                                                    itemCount: allItems.length, // Use the length of your allItems list
                                                    itemBuilder: (context, index) {
                                                      Map<String, dynamic> item = allItems[index]; // Get the item at the current index
                                                      return GestureDetector(
                                                        onTap: (){
                                                          itemId = item['FI_SN'];
                                                          Navigator.pushNamed(
                                                              context, AppRoutes.onlineFoodDetailsScreen);
                                                        },
                                                        child: Container(
                                                          decoration: AppDecoration.outline11.copyWith(
                                                            borderRadius: BorderRadiusStyle.roundedBorder8,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              CustomImageView(
                                                                fit: BoxFit.cover,
                                                                url: item['FIT_IMAGE']?? ImageConstant.imageNotFound, // Use an empty string if the image path is null
                                                                height: getVerticalSize(72),
                                                                width: getHorizontalSize(152),
                                                                radius: BorderRadius.only(
                                                                  topLeft: Radius.circular(getHorizontalSize(7)),
                                                                  topRight: Radius.circular(getHorizontalSize(7)),
                                                                ),
                                                                placeHolder: ImageConstant.imageNotFound, // Specify the path to the default image
                                                              ),
                                                              Padding(
                                                                padding: getPadding(left: 8, top: 5),
                                                                child: Text(
                                                                  item['FI_TITIE'], // Use the title from the item
                                                                  overflow: TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.left,
                                                                  style: theme.textTheme.titleSmall,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: getPadding(left: 8, top: 3),
                                                                child: Text(
                                                                  item['FIC_CAT'], // Use the title from the item
                                                                  overflow: TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.left,
                                                                  style: theme.textTheme.labelLarge,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment: Alignment.center,
                                                                child: Padding(
                                                                  padding: getPadding(top: 3, bottom: 9),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: getPadding(top: 4, bottom: 5),
                                                                        child: Text("Rs."+
                                                                            item['FI_RATE']+ ".00", // Use the rate from the item
                                                                          overflow: TextOverflow.ellipsis,
                                                                          textAlign: TextAlign.left,
                                                                          style: CustomTextStyles.labelLargeBlack90002.copyWith(
                                                                            letterSpacing: getHorizontalSize(0.15),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        onTap: (){
                                                                          var shoppingCartProvider = Provider.of<ShoppingCartProvider>(context, listen: false);
                                                                          var newItem = CartItem(item['FI_SN'], item['FI_TITIE'], double.parse(item['FI_RATE']),1,item['FIT_IMAGE']?? ImageConstant.imageNotFound);
                                                                          shoppingCartProvider.addItem(newItem);
                                                                          print("add to cart");
                                                                          ft.Fluttertoast.showToast(
                                                                            msg: "Item Added to Cart",
                                                                            toastLength: ft.Toast.LENGTH_SHORT,
                                                                          );
                                                                        },
                                                                        child: CustomImageView(
                                                                          svgPath: ImageConstant.imgCart,
                                                                          height: getVerticalSize(23),
                                                                          width: getHorizontalSize(30),
                                                                          margin: getMargin(left: 40),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ])))
                                ])),
                          ),
                        ])),
                Consumer<ShoppingCartProvider>(
                  builder: (context, shoppingCartProvider, _) {
                    int itemCount = shoppingCartProvider.cart.items.length;
                    return Positioned(
                      bottom: 40,
                      right: 40,
                      child: Stack(
                        children: [
                          Container(
                            width: 70, // Set the width as per your desired size
                            height: 70, // Set the height as per your desired size
                            child: FloatingActionButton(
                              child: Icon(Icons.shopping_cart, color: Colors.white),
                              backgroundColor: Colors.amber,
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.onlineFoodReviewPaymentScreen);
                              },
                            ),
                          ),
                          if (itemCount > 0)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: Text(
                                  itemCount.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
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
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeScreenPage:
        return HomeScreenPage();
      default:
        return DefaultWidget();
    }
  }

  onTapWelcome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.onlineFoodDetailsScreen);
  }
  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
String itemId = '';