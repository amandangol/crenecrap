import 'package:e_commerce_app/routes.dart/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  String? image;
  final String? title;
  final String? itemCount;
  final VoidCallback? onTap;
  CategoryItem({
    super.key,
    this.image,
    this.itemCount,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteConstants.routeCategoryDetail);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: Image.network(
                image!,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Column(
                    children: [
                      Text(
                        title!,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${itemCount!} Products",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
