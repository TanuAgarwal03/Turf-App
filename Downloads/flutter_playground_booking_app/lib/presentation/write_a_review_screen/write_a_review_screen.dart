import 'package:flutter/material.dart';
import 'controller/write_a_review_controller.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'package:flutter_playground_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter_playground_booking_app/widgets/custom_text_form_field.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WriteAReviewScreen extends StatefulWidget {
  const WriteAReviewScreen({super.key});

  @override
  State<WriteAReviewScreen> createState() => _WriteAReviewScreenState();
}

class _WriteAReviewScreenState extends State<WriteAReviewScreen> {
  WriteAReviewController controller = Get.put(WriteAReviewController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: appTheme.bgColor,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getCommonAppBar("lbl_write_a_review".tr),
                SizedBox(height: 16.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: CustomTextFormField(
                    controller: controller.reviewController,
                    hintText: "msg_write_your_review".tr,
                    hintStyle: CustomTextStyles.bodyLargeGray60001,
                    textInputAction: TextInputAction.done,
                    maxLines: 7,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '**Review text cannot be blank. Trying adding some experience.';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 15.v),
                Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Text('Rate the review :',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      controller.rating.value = rating.toInt();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildButtons(),
    );
  }

  Widget _buildButtons() {
    return Container(
      width: double.infinity,
      decoration: AppDecoration.white.copyWith(color: appTheme.bgColor),
      child: Padding(
        padding:
            EdgeInsets.only(left: 20.h, right: 20.h, top: 16.v, bottom: 32.v),
        child: CustomElevatedButton(
          text: "lbl_submit_review".tr,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              controller.submitReview();
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
