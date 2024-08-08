import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/my_booking_upcoming_page/controller/my_booking_upcoming_controller.dart';
import 'package:flutter_playground_booking_app/presentation/my_booking_upcoming_page/models/my_booking_upcoming_model.dart';
import 'package:url_launcher/url_launcher.dart';

// // ignore: must_be_immutable
// class MyBookingComplatedPage extends StatelessWidget {
//   MyBookingComplatedPage({Key? key})
//       : super(
//           key: key,
//         );

//   MyBookingComplatedController controller =
//       Get.put(MyBookingComplatedController());

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);

//     return ListView.builder(
//       padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 4.v),
//       itemCount: controller.getMybookingComplated.length,
//       primary: false,
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         MyBookingComplatedModel data = controller.getMybookingComplated[index];
//         return animationfunction(index, Padding(
//           padding: EdgeInsets.symmetric(vertical: 8.v),
//           child: GestureDetector(
//             onTap: () {},
//             child: Container(
//               padding: EdgeInsets.all(4.h),
//               decoration: AppDecoration.fillGray.copyWith(
//                 color: appTheme.textfieldFillColor,
//                 borderRadius: BorderRadiusStyle.roundedBorder16,
//               ),
//               child: Row(
//                 children: [
//                   CustomImageView(
//                     imagePath: data.image,
//                     height: 90.adaptSize,
//                     width: 90.adaptSize,
//                     radius: BorderRadius.circular(
//                       16.h,
//                     ),
//                     margin: EdgeInsets.only(top: 2.v),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       left: 16.h,
//                       top: 23.v,
//                       bottom: 17.v,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           data.title!,
//                           style: theme.textTheme.titleMedium!.copyWith(
//                             color: appTheme.black900,
//                           ),
//                         ),
//                         SizedBox(height: 9.v),
//                         Row(
//                           children: [
//                             CustomImageView(
//                               imagePath: ImageConstant.imgIcLocationGray60001,
//                               height: 20.adaptSize,
//                               width: 20.adaptSize,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(left: 8.h),
//                               child: Text(
//                                 data.location!,
//                                 style: theme.textTheme.bodyMedium,
//                               ),
//                             ),
//                             CustomImageView(
//                               imagePath: ImageConstant.imgIcBooking,
//                               height: 20.adaptSize,
//                               width: 20.adaptSize,
//                               margin: EdgeInsets.only(left: 16.h),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 left: 8.h,
//                                 top: 2.v,
//                               ),
//                               child: Text(
//                                 data.location!,
//                                 style: theme.textTheme.bodyMedium,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//       },
//     );
//   }
// }
class MyBookingComplatedPage extends StatelessWidget {
  MyBookingComplatedPage({Key? key}) : super(key: key);

  final MyBookingUpcomingController controller = Get.find<MyBookingUpcomingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.getMybookingCompleted.isEmpty) {
          return Center(child: Text('No completed bookings'));
        } else {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            itemCount: controller.getMybookingCompleted.length,
            itemBuilder: (context, index) {
              MyBookingUpcomingModel data = controller.getMybookingCompleted[index];

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
                                  style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
                                ),
                              ),
                              SizedBox(width: 16),
                              Icon(Icons.access_time,
                                  size: 20, color: Colors.grey[600]),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  '${data.timeFrom} ',
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          InkWell(
                            onTap: () async {
                              final phoneNumber = data.phoneNumber;
                              if (phoneNumber.isNotEmpty) {
                                final Uri url = Uri(scheme: 'tel', path: phoneNumber);
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  print('Could not launch $url');
                                }
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
