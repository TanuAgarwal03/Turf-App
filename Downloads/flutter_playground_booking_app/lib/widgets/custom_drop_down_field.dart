import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';

class CustomDropdownButtonFormField<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final String? hint;
  final Color? fillColor;
  final String? labelText;

  const CustomDropdownButtonFormField({
    Key? key,
    this.value,
    this.items,
    this.onChanged,
    this.hint,
    this.fillColor,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: fillColor ?? appTheme.textfieldFillColor,
        borderRadius: BorderRadius.circular(16.h),
      ),
      child: DropdownButtonFormField<T>(
        value: value,
        items: items,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey[600]),
          hintText: hint,
          hintStyle: CustomTextStyles.bodyLargeGray600,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.h),
            borderSide: BorderSide(color: appTheme.buttonColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.h),
            borderSide: BorderSide(
              color: appTheme.red700,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.h),
            borderSide: BorderSide(
              color: appTheme.red700,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
