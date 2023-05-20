import 'package:e_commerce_app/categories_section/widgets/category_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});
  List<String>? categoryType = [
    "New Arrivals",
    "Clothes",
    "Bags",
    "Shoes",
    "Electronics",
    "Jewelry"
  ];
  List<String>? noOfProducts = ["208", "322", "156", "180", "100", "88"];

  List<String>? categoryTypeimages = [
    "https://images.pexels.com/photos/2081332/pexels-photo-2081332.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/4641825/pexels-photo-4641825.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1152077/pexels-photo-1152077.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/238118/pexels-photo-238118.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/3641056/pexels-photo-3641056.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // centerTitle: true,
          title: Text(
            "Categories",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: TextField(
                // controller: _searchController,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  hintText: "Search for a product...",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  suffixIcon: const Icon(
                    Icons.sort_outlined,
                    color: Colors.black,
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: GridView.builder(
                  itemCount: categoryType!.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 8.0, // Spacing between each column
                    mainAxisSpacing: 8.0, // Spacing between each row
                  ),
                  itemBuilder: (context, index) {
                    final categorytype = categoryType![index];
                    final productCount = noOfProducts![index];
                    final categoryImages = categoryTypeimages![index];
                    return CategoryItem(
                      title: categorytype,
                      image: categoryImages,
                      itemCount: productCount,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
