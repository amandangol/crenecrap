import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Color? buttonColor;
  final VoidCallback? onTap;
  final Color? textColor;
  const CustomButton(
      {super.key, this.buttonColor, this.onTap, this.title, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: const BorderRadius.all(Radius.circular(24))),
          child: Text(
            title!,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor,
                fontSize: 22,
                fontFamily: "Open Sans",
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
