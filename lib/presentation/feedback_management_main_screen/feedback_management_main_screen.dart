import 'package:flutter/material.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_stack_1.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../home_screen_container_screen/home_screen_container_screen.dart';

class FeedbackManagementMainScreen extends StatelessWidget {
  const FeedbackManagementMainScreen();
  @override
  Widget build(BuildContext context) {
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
              FocusScope.of(context).unfocus();
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: AppbarSubtitle(text: "Feedback Management"),
          actions: [
            AppbarStack1(
              margin: getMargin(left: 24, top: 8, right: 24, bottom: 8),
            )
          ],
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(left: 23, right: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: getPadding(left: 1, top: 29, right: 1),
                  child: GridView.builder(
                    shrinkWrap: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: getVerticalSize(60),
                      crossAxisCount: 1,
                      mainAxisSpacing: getHorizontalSize(13),
                      crossAxisSpacing: getHorizontalSize(13),
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return buildItemView(index, context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemView(int index, BuildContext context) {
    final List<String> titles = ["Add Complaint", "Add Suggestion", "Search Complaint"];
    final List<IconData> icons = [Icons.report, Icons.self_improvement, Icons.search];

    return GestureDetector(
      onTap: () {
        final List<String> routes = [AppRoutes.feedbackManagementScreen, AppRoutes.feedbackManagementSuggestionScreen, AppRoutes.feedbackManagementSearchComplaintScreen];
        Navigator.pushNamed(context, routes[index]);
      },
      child: Container(
        padding: getPadding(all: 8),
        decoration: AppDecoration.outline2.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Row(
          children: [
            Icon(icons[index]),
            Padding(
              padding: getPadding(left: 12, top: 4),
              child: Text(
                titles[index],
                maxLines: 2,
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
}
