import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.network(
                    "https://images.pexels.com/photos/934070/pexels-photo-934070.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gia Borghni",
                        style: TextStyle(
                            height: 1.5,
                            color: Colors.black,
                            fontFamily: "TT Commons",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      sboxH6,
                      Text(
                        "RHW Rosie 1 Sandals",
                        style: TextStyle(
                            height: 1.5,
                            color: Colors.grey,
                            fontFamily: "TT Commons",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                      ),
                      sboxH6,
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            "(4.5)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                color: Colors.black,
                                fontFamily: "TT Commons",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  "Rs. 2555",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.5,
                      color: Colors.black,
                      fontFamily: "TT Commons",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
