import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Icon? icon;
  final Color? backgroundColor;
  final void Function()? onTap;
  final double? width;
  final Color? hintTextColor;
  final String? attribute;
  final FormFieldValidator<String>? validator;
  final TextInputType? textInputType;
  final String? initialValue;
  final TextEditingController? controller;
  final ValueChanged? onSaved;
  final bool enabled;
  final InputDecoration? inputDecoration;
  final bool autoFocus;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;
  final int? maxLines;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  const CustomTextFormField(
      {super.key,
      this.onTap,
      this.labelText,
      this.hintText,
      this.icon,
      this.backgroundColor,
      this.width,
      this.attribute,
      this.onSaved,
      this.hintTextColor,
      this.validator,
      this.initialValue,
      this.textInputType,
      this.obscureText,
      this.textInputAction,
      this.controller,
      this.enabled = true,
      this.inputDecoration,
      this.autoFocus = false,
      this.suffixIcon,
      this.maxLength,
      this.prefixIcon,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textInputAction: textInputAction,
        style: const TextStyle(fontSize: 14),
        obscureText: obscureText!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(fontFamily: "Poppins"),
          floatingLabelStyle:
              const TextStyle(color: Color(0xff4FD482), fontFamily: "Poppins"),
          labelStyle: const TextStyle(fontFamily: "Poppins"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              width: 1,
              color: const Color(0xff4FD482).withOpacity(0.5),
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              width: 1,
              color: const Color(0xff4FD482).withOpacity(0.5),
              style: BorderStyle.solid,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              width: 1,
              color: const Color(0xff4FD482).withOpacity(0.5),
              style: BorderStyle.solid,
            ),
          ),
        ),
        validator: validator,
        onSaved: onSaved);
  }
}
