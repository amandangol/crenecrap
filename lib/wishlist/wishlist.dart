import 'package:e_commerce_app/wishlist/widgets/wishlist_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});
  List<String>? productImage = [
    "https://images.pexels.com/photos/3661622/pexels-photo-3661622.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/428311/pexels-photo-428311.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/934070/pexels-photo-934070.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/2081199/pexels-photo-2081199.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];
  List<String?> productName = [
    "Robbins Wills",
    "Gucci Guc",
    "Nepathya",
    "Mheecha",
    "aa"
  ];
  List<String?> productSubtitle = [
    "Vegas Lmea",
    "Camaflouge leme",
    "Nepsyadzzz",
    "dashdash"
  ];
  List<String?> price = ['2999', "5555", "3299"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Text(
          "Wishlist",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 17.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: 8,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return WishListItems(
                  productImage: (index >= 0 && index < productImage!.length)
                      ? productImage![index]
                      : "",
                  price:
                      (index >= 0 && index < price.length) ? price[index] : "",
                  productName: (index >= 0 && index < productName.length)
                      ? productName[index]
                      : "",
                  productSubtitle:
                      (index >= 0 && index < productSubtitle.length)
                          ? productSubtitle[index]
                          : "",
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
