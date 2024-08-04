import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/presentation/nearby_you_screen/controller/nearby_you_controller.dart';
import 'package:flutter_playground_booking_app/presentation/nearby_you_screen/models/nearby_you_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NearbyYouScreen extends StatefulWidget {
  const NearbyYouScreen({super.key});

  @override
  State<NearbyYouScreen> createState() => _NearbyYouScreenState();
}

class _NearbyYouScreenState extends State<NearbyYouScreen> {
  NearbyYouController controller = Get.put(NearbyYouController());

  @override
  void initState() {
    super.initState();
    loadDistance();
    controller.fetchTurflist();
    loadDistance();
  }
  Future<String?> loadDistance() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('stored_distance');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nearby You"),
      ),
      body: Obx(() {
        if (controller.turfList.isEmpty) {
          return Center(child: Text("No data available"));
        } else {
          return ListView.builder(
            itemCount: controller.turfList.length,
            itemBuilder: (context, index) {
              NearbyYouModel data = controller.turfList[index];
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.detailScreen);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      decoration: AppDecoration.fillGray.copyWith(
                          color: appTheme.textfieldFillColor,
                          borderRadius: BorderRadiusStyle.roundedBorder16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 140,
                            width: double.infinity,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Image.network(
                                    data.image!,
                                    height: 140,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 12, right: 12),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      data.distance ?? '... km',
                                      // controller.distanceInKm,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              data.title!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                CustomImageView(
                                  color: appTheme.black900,
                                  imagePath: ImageConstant.imgIcLocation,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.h),
                                  child: Text(data.location ?? 'No location',
                                      style:
                                          theme.textTheme.bodyMedium!.copyWith(
                                        color: appTheme.black900,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16)
                        ],
                      ),
                    ),
                  ));
            },
          );
        }
      }),
    );
  }
}
