import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_iconbutton.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_stack_1.dart';
import 'package:islamabad_club_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:islamabad_club_app/widgets/app_bar/custom_app_bar.dart';
class AllEventsScreen extends StatelessWidget {
  AllEventsScreen();
  @override
  Widget build(BuildContext context) {
    List<Event> events = [
      Event(
        image: 'https://media.istockphoto.com/id/1411960046/photo/young-asian-family-of-three-walking-hand-in-hand.jpg?s=2048x2048&w=is&k=20&c=iOGGVwDVtOiU1N-1aVYYxS_leKSlz1Yrjh46ku-a_tE=',
        name: 'Event 1',
        details: 'Event 1 Details',
        time: '10:00 AM - 12:00 PM',
      ),
      Event(
        image: 'https://media.istockphoto.com/id/1411960046/photo/young-asian-family-of-three-walking-hand-in-hand.jpg?s=2048x2048&w=is&k=20&c=iOGGVwDVtOiU1N-1aVYYxS_leKSlz1Yrjh46ku-a_tE=',
        name: 'Event 2',
        details: 'Event 2 Details',
        time: '2:00 PM - 4:00 PM',
      ),Event(
        image: 'https://media.istockphoto.com/id/1411960046/photo/young-asian-family-of-three-walking-hand-in-hand.jpg?s=2048x2048&w=is&k=20&c=iOGGVwDVtOiU1N-1aVYYxS_leKSlz1Yrjh46ku-a_tE=',
        name: 'Event 1',
        details: 'Event 1 Details',
        time: '10:00 AM - 12:00 PM',
      ),
      Event(
        image: 'https://media.istockphoto.com/id/1411960046/photo/young-asian-family-of-three-walking-hand-in-hand.jpg?s=2048x2048&w=is&k=20&c=iOGGVwDVtOiU1N-1aVYYxS_leKSlz1Yrjh46ku-a_tE=',
        name: 'Event 2',
        details: 'Event 2 Details',
        time: '2:00 PM - 4:00 PM',
      ),Event(
        image: 'https://media.istockphoto.com/id/1411960046/photo/young-asian-family-of-three-walking-hand-in-hand.jpg?s=2048x2048&w=is&k=20&c=iOGGVwDVtOiU1N-1aVYYxS_leKSlz1Yrjh46ku-a_tE=',
        name: 'Event 1',
        details: 'Event 1 Details',
        time: '10:00 AM - 12:00 PM',
      ),
      Event(
        image: 'https://media.istockphoto.com/id/1411960046/photo/young-asian-family-of-three-walking-hand-in-hand.jpg?s=2048x2048&w=is&k=20&c=iOGGVwDVtOiU1N-1aVYYxS_leKSlz1Yrjh46ku-a_tE=',
        name: 'Event 2',
        details: 'Event 2 Details',
        time: '2:00 PM - 4:00 PM',
      ),Event(
        image: 'https://media.istockphoto.com/id/1411960046/photo/young-asian-family-of-three-walking-hand-in-hand.jpg?s=2048x2048&w=is&k=20&c=iOGGVwDVtOiU1N-1aVYYxS_leKSlz1Yrjh46ku-a_tE=',
        name: 'Event 1',
        details: 'Event 1 Details',
        time: '10:00 AM - 12:00 PM',
      ),
      Event(
        image: 'https://media.istockphoto.com/id/1411960046/photo/young-asian-family-of-three-walking-hand-in-hand.jpg?s=2048x2048&w=is&k=20&c=iOGGVwDVtOiU1N-1aVYYxS_leKSlz1Yrjh46ku-a_tE=',
        name: 'Event 2',
        details: 'Event 2 Details',
        time: '2:00 PM - 4:00 PM',
      ),Event(
        image: 'https://media.istockphoto.com/id/1411960046/photo/young-asian-family-of-three-walking-hand-in-hand.jpg?s=2048x2048&w=is&k=20&c=iOGGVwDVtOiU1N-1aVYYxS_leKSlz1Yrjh46ku-a_tE=',
        name: 'Event 1',
        details: 'Event 1 Details',
        time: '10:00 AM - 12:00 PM',
      ),
      Event(
        image: 'https://media.istockphoto.com/id/1411960046/photo/young-asian-family-of-three-walking-hand-in-hand.jpg?s=2048x2048&w=is&k=20&c=iOGGVwDVtOiU1N-1aVYYxS_leKSlz1Yrjh46ku-a_tE=',
        name: 'Event 2',
        details: 'Event 2 Details',
        time: '2:00 PM - 4:00 PM',
      ),
    ];
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
              title: AppbarSubtitle(text: "All Events"),
              actions: [
                AppbarStack1(
                    margin: getMargin(left: 24, top: 8, right: 24, bottom: 8))
              ]),
          resizeToAvoidBottomInset: false,
          body: ListView.builder(
            itemCount: events.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  SizedBox(height: 10,),
                  InkWell(
                      onTap: (){
                        print(index);
                      },
                      child: EventItem(event: events[index])),
                ],
              );
            },
          ),
        )
    );
  }
}

class EventItem extends StatelessWidget {
  final Event event;
  EventItem({required this.event});

  @override
  Widget build(BuildContext context) {
    return EventCard(image: event.image, name: event.name, details: event.details, time: event.time);
  }
}
class Event {
  final String image;
  final String name;
  final String details;
  final String time;

  Event({
    required this.image,
    required this.name,
    required this.details,
    required this.time,
  });
}
class EventCard extends StatelessWidget {
  final String image;
  final String name;
  final String details;
  final String time;

  EventCard({
    required this.image,
    required this.name,
    required this.details,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.9; // 90% of the screen width

    return Container(
      width: cardWidth, // Set the width based on the screen width.
      height: 114,
      padding: const EdgeInsets.all(10.42),
      decoration: BoxDecoration(
        color: Color(0xFFF5F4F7),
        borderRadius: BorderRadius.circular(6.25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: cardWidth * 0.34, // Adjust the image width as needed (approximately 34% of card width).
            height: 93,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(18.55),
              border: Border.all(
                width: 5.56,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10.42),
          Container(
            width: cardWidth * 0.52, // Adjust the text content width as needed (approximately 62% of card width).
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Color(0xFF242B5C),
                    fontSize: 12.50,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.38,
                  ),
                ),
                const SizedBox(height: 4.17),
                SizedBox(
                  width: cardWidth * 0.62, // Use the same width for text content as defined above.
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Details: ',
                          style: TextStyle(
                            color: Color(0xFF53577A),
                            fontSize: 10.42,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.31,
                          ),
                        ),
                        TextSpan(
                          text: details,
                          style: TextStyle(
                            color: Color(0xFF242B5C),
                            fontSize: 10.42,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.31,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4.17),
                Text(
                  'Time: $time',
                  style: TextStyle(
                    color: Color(0xFFA1A4C1),
                    fontSize: 8.34,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

