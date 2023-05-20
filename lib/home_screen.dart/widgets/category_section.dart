import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CaetgoriesSection extends StatelessWidget {
  CaetgoriesSection({
    super.key,
  });
  List<String>? categories = [
    "Dresses",
    "Jackets",
    "Jeans",
    "Shoes",
    "Bags",
    "Jewelry"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories!.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final category = categories![index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(1),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    category.toString(),
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12.sp,
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
