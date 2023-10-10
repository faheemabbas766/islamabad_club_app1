import 'package:flutter/material.dart';
import 'package:islamabad_club_app/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.enabled,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.fillColor,
    this.filled = false,
    this.contentPadding,
    this.defaultBorderDecoration,
    this.enabledBorderDecoration,
    this.focusedBorderDecoration,
    this.disabledBorderDecoration,
    this.validator
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final EdgeInsetsGeometry? margin;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final bool? enabled;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final Color? fillColor;

  final bool? filled;

  final EdgeInsets? contentPadding;

  final InputBorder? defaultBorderDecoration;

  final InputBorder? enabledBorderDecoration;

  final InputBorder? focusedBorderDecoration;

  final InputBorder? disabledBorderDecoration;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => Container(
        width: width ?? double.maxFinite,
        margin: margin,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode ?? FocusNode(),
          autofocus: autofocus!,
          style: textStyle,
          obscureText: obscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle,
        enabled: enabled?? true,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        fillColor: fillColor,
        filled: filled,
        isDense: true,
        contentPadding: contentPadding,
        border: defaultBorderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  5.00,
                ),
              ),
              borderSide: BorderSide(
                color: appTheme.black90002,
                width: 1,
              ),
            ),
        enabledBorder: enabledBorderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  5.00,
                ),
              ),
              borderSide: BorderSide(
                color: appTheme.black90002,
                width: 1,
              ),
            ),
        focusedBorder: focusedBorderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  5.00,
                ),
              ),
              borderSide: BorderSide(
                color: appTheme.black90002,
                width: 1,
              ),
            ),
        disabledBorder: disabledBorderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  5.00,
                ),
              ),
              borderSide: BorderSide(
                color: appTheme.black90002,
                width: 1,
              ),
            ),
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineGray9007f => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        ),
        borderSide: BorderSide(
          color: appTheme.gray9007f,
          width: 1,
        ),
      );
  static OutlineInputBorder get outlineBlack90002 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        ),
        borderSide: BorderSide(
          color: appTheme.black90002,
          width: 1,
        ),
      );
  static OutlineInputBorder get outlineBlack90001 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        ),
        borderSide: BorderSide(
          color: appTheme.black90001,
          width: 1,
        ),
      );
  static OutlineInputBorder get outlineBlack90002TL5 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        ),
        borderSide: BorderSide(
          color: appTheme.black90002,
          width: 1,
        ),
      );
  static OutlineInputBorder get outlineBluegray100 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        ),
        borderSide: BorderSide(
          color: appTheme.blueGray100,
          width: 1,
        ),
      );
  static OutlineInputBorder get outlineBluegray400 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        ),
        borderSide: BorderSide(
          color: appTheme.blueGray400,
          width: 1,
        ),
      );
  static OutlineInputBorder get outlineGray200 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            9.00,
          ),
        ),
        borderSide: BorderSide(
          color: appTheme.gray200,
          width: 1,
        ),
      );
}
