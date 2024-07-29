import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';


// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {
  CustomDropDown(
      {this.shape,
        this.padding,
        this.variant,
        this.fontStyle,
        this.alignment,
        this.width,
        this.margin,
        this.focusNode,
        this.autofocus = false,
        this.icon,
        this.hintText,
        this.prefix,
        this.prefixConstraints,
        this.items,
        this.onChanged,
        this.validator});

  DropDownShape? shape;

  DropDownPadding? padding;

  DropDownVariant? variant;

  DropDownFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  FocusNode? focusNode;

  bool? autofocus;

  Widget? icon;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  List<SelectionPopupModel>? items;

  Function(SelectionPopupModel)? onChanged;

  FormFieldValidator<SelectionPopupModel>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: _buildDropDownWidget(),
    )
        : _buildDropDownWidget();
  }

  _buildDropDownWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: DropdownButtonFormField<SelectionPopupModel>(

        focusNode: focusNode,
        autofocus: autofocus!,
        icon: icon,
        style: _setFontStyle(),
        decoration: _buildDecoration(),
        items: items?.map((SelectionPopupModel item) {
          return DropdownMenuItem<SelectionPopupModel>(
            value: item,
            child: Text(
              item.title,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge!.copyWith(color:appTheme.black900),
            ),
          );
        }).toList(),
        onChanged: (value) {
          onChanged!(value!);
        },
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: CustomTextStyles.bodyLargeGray600,
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      fillColor: appTheme.textfieldFillColor,
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      default:
        return BorderRadius.circular(
         16.h
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case DropDownVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: appTheme.textfieldFillColor,
            width: 1.h,
          ),
        );
    }
  }


  _setFilled() {
    switch (variant) {
      case DropDownVariant.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      default:
        return EdgeInsets.only(left: 16.h,top: 16.v,bottom: 16.v);
    }
  }
}

enum DropDownShape {
  RoundedBorder16,
}
enum DropDownPadding {
  PaddingT16,
}
enum DropDownVariant {
  None,
  White,
}
enum DropDownFontStyle {
  Body,
}
