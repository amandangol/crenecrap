import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewArrivals extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? price;
  final String? image;
  final Color? color;
  final VoidCallback? onTap;
  const NewArrivals(
      {super.key,
      this.title,
      this.image,
      this.color,
      this.onTap,
      this.price,
      this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(17))),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(17)),
                child: Image.network(
                  image!,
                  height: 100.h,
                  width: 100.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            sboxH10,
            Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.5,
                  color: Colors.black,
                  fontFamily: "TT Commons",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "TT Commons",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              price!,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "TT Commons",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
