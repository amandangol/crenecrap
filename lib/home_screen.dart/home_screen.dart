import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:e_commerce_app/home_screen.dart/widgets/category_section.dart';
import 'package:e_commerce_app/home_screen.dart/widgets/newarrivals_section.dart';
import 'package:e_commerce_app/home_screen.dart/widgets/popular_section.dart';
import 'package:e_commerce_app/routes.dart/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Hello Seun!",
              style: TextStyle(
                  fontFamily: "Open Sans",
                  fontSize: 18.sp,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              "We have some options for you to consider.",
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500),
            ),
            trailing: const CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/762020/pexels-photo-762020.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: TextField(
              autofocus: false,
              controller: _searchController,
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
          sboxH10,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteConstants.routeCategory);
                  },
                  child: Text(
                    "View all",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                        fontFamily: "Poppins"),
                  ),
                ),
              ],
            ),
          ),
          CaetgoriesSection(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Arrivals",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteConstants.routeCategoryDetail);
                  },
                  child: Text(
                    "View all",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                        fontFamily: "Poppins"),
                  ),
                ),
              ],
            ),
          ),
          sboxH10,
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => NewArrivals(
                image:
                    "https://images.pexels.com/photos/2081199/pexels-photo-2081199.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                title: "The Marc Jacobs",
                subtitle: "Traveler Tote",
                price: "Rs. 2999",
                onTap: () {
                  Navigator.pushNamed(
                      context, RouteConstants.routeProductDetail);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "View all",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      fontFamily: "Poppins"),
                ),
              ],
            ),
          ),
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const PopularSection();
              })
        ],
      ),
    );
  }
}
