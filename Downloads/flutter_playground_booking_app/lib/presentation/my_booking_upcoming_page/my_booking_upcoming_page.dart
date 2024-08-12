import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller/my_booking_upcoming_controller.dart';
import 'models/my_booking_upcoming_model.dart';

class MyBookingUpcomingPage extends StatefulWidget {
  MyBookingUpcomingPage({Key? key}) : super(key: key);

  @override
  State<MyBookingUpcomingPage> createState() => _MyBookingUpcomingPageState();
}

class _MyBookingUpcomingPageState extends State<MyBookingUpcomingPage> {
  final MyBookingUpcomingController controller =
      Get.put(MyBookingUpcomingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.blue,
              size: 50,
            ),);
        } else if (controller.getMybookingUpcoming.isEmpty) {
          return Center(child: Text('No upcoming bookings'));
        } else {
          final now = DateTime.now();
          final upcomingBookings = controller.getMybookingUpcoming.where((booking) {
            final bookingDate = DateTime.parse(booking.bookingDate);
            return bookingDate.isAfter(now);
          }).toList();

          if (upcomingBookings.isEmpty) {
            return Center(child: Text('No upcoming bookings'));
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            itemCount: upcomingBookings.length,
            itemBuilder: (context, index) {
              MyBookingUpcomingModel data = upcomingBookings[index];

              DateTime bookingDate = DateTime.parse(data.bookingDate);
              bool isNewDate = bookingDate.isAfter(DateTime.now());
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.turfName,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: appTheme.black900,
                                ),
                              ),
                              Text(
                                "Booking id : ${data.id}",
                                style: theme.textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.account_circle_outlined,
                                  size: 20, color: Colors.grey[600]),
                              SizedBox(width: 8),
                              Text(
                                data.name,
                                style: theme.textTheme.titleMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.calendar_month,
                                  size: 20, color: Colors.grey[600]),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  data.bookingDate,
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    color: isNewDate ? Colors.green : Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Icon(Icons.access_time,
                                  size: 20, color: Colors.grey[600]),
                              Container(
                                width: 150,
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  '${data.timeFrom} ',  //${data.timeFrom} - ${data.timeTo}
                                  style: theme.textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          InkWell(
                            onTap: () async {
                              final phoneNumber = data.phoneNumber;
                              if (phoneNumber.isNotEmpty) {
                                final Uri url =
                                    Uri(scheme: 'tel', path: phoneNumber);
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  print('Could not launch $url');
                                }
                              } else {
                                print('Phone number is null or empty');
                              }
                            },
                            child: Row(
                              children: [
                                Icon(Icons.local_phone_outlined,
                                    size: 20, color: Colors.grey[600]),
                                SizedBox(width: 8),
                                Text(
                                  data.phoneNumber,
                                  style: theme.textTheme.bodyLarge,
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
            },
          );
        }
      }),
    );
  }
}
