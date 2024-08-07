import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller/my_booking_upcoming_controller.dart';
import 'models/my_booking_upcoming_model.dart';
import 'package:flutter/material.dart';

class MyBookingUpcomingPage extends StatefulWidget {
  MyBookingUpcomingPage({Key? key}) : super(key: key);

  @override
  State<MyBookingUpcomingPage> createState() => _MyBookingUpcomingPageState();
}

class _MyBookingUpcomingPageState extends State<MyBookingUpcomingPage> {
  MyBookingUpcomingController controller =
      Get.put(MyBookingUpcomingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.getMybookingUpcoming.isEmpty) {
          return Center(child: Text('No upcoming bookings'));
        } else {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            itemCount: controller.getMybookingUpcoming.length,
            itemBuilder: (context, index) {
              MyBookingUpcomingModel data =
                  controller.getMybookingUpcoming[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () {
                  },
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
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                              SizedBox(width: 16),
                              Icon(Icons.access_time,
                                  size: 20, color: Colors.grey[600]),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  '${data.timeFrom} - ${data.timeTo}',
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          InkWell(
                            onTap:() async {
                              print('Tap detected');
                              final phoneNumber = data.phoneNumber;
                              print('Phone number: $phoneNumber');
                              if (data.phoneNumber.isNotEmpty) {
                                final Uri url =
                                    Uri(scheme: 'tel', path: data.phoneNumber);
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  print('Could not launch $url');
                                }
                              } else {
                                print('Phone number is null or empty');
                              }
                            } ,
                            child:Row(
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
