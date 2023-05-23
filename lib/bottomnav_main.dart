import 'package:e_commerce_app/bottom_navigation/bottom_nav_appbar.dart';
import 'package:e_commerce_app/cubit/bottom_navigation_cubit.dart';
import 'package:e_commerce_app/home_screen.dart/home_screen.dart';
import 'package:e_commerce_app/mycart/my_cart.dart';
import 'package:e_commerce_app/profilescreen/profile_screen.dart';
import 'package:e_commerce_app/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavHome extends StatelessWidget {
  const BottomNavHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationAppBar(),
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<BottomNavBarMenuChangeCubit, int>(
            builder: (ctx, navMenuIndex) {
          if (navMenuIndex == 0) {
            return HomeScreen();
            // return const NewsFeed();
          } else if (navMenuIndex == 1) {
            return MyCart();
            // return const Cart();
          } else if (navMenuIndex == 2) {
            return WishlistScreen();
          } else if (navMenuIndex == 3) {
            return ProfileScreen();
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
