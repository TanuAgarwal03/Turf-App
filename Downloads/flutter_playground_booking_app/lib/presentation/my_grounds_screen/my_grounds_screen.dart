import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/my_grounds_controller.dart';
import 'models/mygrounds_item_model.dart';

class MyGroundsScreen extends StatefulWidget {
  const MyGroundsScreen({super.key});

  @override
  State<MyGroundsScreen> createState() => _MyGroundsScreenState();
}

class _MyGroundsScreenState extends State<MyGroundsScreen> {
  final MyGroundsController controller = Get.put(MyGroundsController());
  String? role;

   @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        role = prefs.getString('role'); 
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        backgroundColor: appTheme.bgColor,
        body: SafeArea(
          child: Column(
            children: [
              getCommonAppBar("lbl_my_grounds".tr),
              SizedBox(height: 16.v),
              Expanded(
                child: buildMyGrounds(),
            ),
              if (role != 'user') 
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: appTheme.bgColor,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 16.v, bottom: 32.v, left: 20.h, right: 20.h),
                          child: buildButtons(),
                        ),
                      ),
                    ),
            
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMyGrounds() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Obx(
        () => ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.v);
          },
          itemCount: controller.myGroundList.length,
          itemBuilder: (context, index) {
            MygroundsItemModel model = controller.myGroundList[index];
            return MygroundsItemWidget(model);
          },
        ),
      ),
    );
  }

  Widget buildButtons() {
    return Container(
      width: double.infinity,
      color: appTheme.bgColor,
      child: Padding(
        padding: EdgeInsets.only(top: 16.v, bottom: 32.v, left: 20.h, right: 20.h),
        child: CustomElevatedButton(
          text: "lbl_add".tr,
          onPressed: () {
            onTapAdd();
          },
        ),
      ),
    );
  }

  void onTapAdd() {
    Get.toNamed(
      AppRoutes.addGroundScreen,
    );
  }
}

class MygroundsItemWidget extends StatelessWidget {
  final MygroundsItemModel mygroundsItemModelObj;

  MygroundsItemWidget(this.mygroundsItemModelObj, {Key? key}) : super(key: key);

  final MyGroundsController controller = Get.find<MyGroundsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.h),
      decoration: AppDecoration.fillGray.copyWith(
        color: appTheme.textfieldFillColor,
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: mygroundsItemModelObj.image ?? 'assets/images/img_avtar_1.svg',
            height: 90.adaptSize,
            width: 90.adaptSize,
            radius: BorderRadius.circular(16.h),
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 22.v, bottom: 20.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mygroundsItemModelObj.title ?? 'No title',
                    style: CustomTextStyles.titleMediumBlack900,
                  ),
                  SizedBox(height: 6.v),
                  Text(
                    mygroundsItemModelObj.description ?? 'Turf description',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: CustomTextStyles.bodyLargeGray60001.copyWith(
                      color: appTheme.gray60001,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
