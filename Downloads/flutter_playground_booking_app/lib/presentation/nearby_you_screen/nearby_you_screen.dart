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
    controller.fetchTurflist();
  }

  Future<void> _storeSelectedId(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selected_turf_id', id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nearby You"),
      ),
      body: Obx(() {
        double? parseDistance(String? distance) {
          if (distance != null && distance.isNotEmpty) {
            final value =
                double.tryParse(distance.replaceAll(RegExp(r'[^\d.]'), ''));
            return value;
          }
          return null;
        }

        // Sorting the turfList by distance
        final sortedTurfList = controller.turfList
          ..sort((a, b) {
            final distanceA = parseDistance(a.distance);
            final distanceB = parseDistance(b.distance);
            return (distanceA ?? double.infinity)
                .compareTo(distanceB ?? double.infinity);
          });

        if (sortedTurfList.isEmpty) {
          return Center(child: Text("No data available"));
        } else {
          return ListView.builder(
            itemCount: sortedTurfList.length,
            itemBuilder: (context, index) {
              NearbyYouModel data = sortedTurfList[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () async {
                    await _storeSelectedId(data.id!);
                    Get.toNamed(AppRoutes.detailScreen,
                        arguments: {'id': data.id});
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
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
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
                              Container(
                                width: 250,
                                child: Padding(
                                padding: EdgeInsets.only(left: 8.h),
                                child: Text(data.location ?? 'No location',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: appTheme.black900,
                                    )),
                              ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 16)
                      ],
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
