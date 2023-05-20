import 'package:e_commerce_app/auth/forgot_password/forgot_password.dart';
import 'package:e_commerce_app/auth/login_screen/login_screen.dart';
import 'package:e_commerce_app/auth/otp_screen/otp_screen.dart';
import 'package:e_commerce_app/auth/signup_screen.dart/signup_screen.dart';
import 'package:e_commerce_app/bottomnav_main.dart';
import 'package:e_commerce_app/categories_section/category_detail_page.dart';
import 'package:e_commerce_app/categories_section/category_page.dart';
import 'package:e_commerce_app/mycart/my_cart.dart';
import 'package:e_commerce_app/product_details/product_detail.dart';
import 'package:e_commerce_app/splash_screen.dart';
import 'package:e_commerce_app/wishlist/wishlist.dart';
import 'package:flutter/material.dart';

import 'custom_route.dart';
import 'route_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  if (settings.name == RouteConstants.routeSplash) {
    return CustomPageRouteBuilder(widget: const SplashAnimationScreen());
  } else if (settings.name == RouteConstants.routeLogin) {
    return CustomPageRouteBuilder(widget: const LoginScreen());
  } else if (settings.name == RouteConstants.routeSignup) {
    return CustomPageRouteBuilder(widget: const SignUpScreen());
  } else if (settings.name == RouteConstants.routeOtp) {
    return CustomPageRouteBuilder(widget: OTPScreen());
  } else if (settings.name == RouteConstants.routeForgotPw) {
    return CustomPageRouteBuilder(widget: ForgotPassword());
  } else if (settings.name == RouteConstants.routeHome) {
    return CustomPageRouteBuilder(widget: const BottomNavHome());
  } else if (settings.name == RouteConstants.routeCategory) {
    return CustomPageRouteBuilder(widget: CategoriesPage());
  } else if (settings.name == RouteConstants.routeCategoryDetail) {
    return CustomPageRouteBuilder(widget: const CategoriesDetailPage());
  } else if (settings.name == RouteConstants.routeProductDetail) {
    return CustomPageRouteBuilder(widget: ProductDetails());
  } else if (settings.name == RouteConstants.routeProductDetail) {
    return CustomPageRouteBuilder(widget: ProductDetails());
  } else if (settings.name == RouteConstants.routeWishlist) {
    return CustomPageRouteBuilder(widget: WishlistScreen());
  } else if (settings.name == RouteConstants.routeMyCart) {
    return CustomPageRouteBuilder(widget: MyCart());
  }

  return CustomPageRouteBuilder(
    settings: settings,
    widget: const Text('No Route Found'),
  );
}
