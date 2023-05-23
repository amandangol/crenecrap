import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenuItems extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final VoidCallback? onTap;
  const ProfileMenuItems({super.key, this.icon, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Icon(icon!),
          ),
          sboxW10,
          Text(
            title!,
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 14.sp),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
