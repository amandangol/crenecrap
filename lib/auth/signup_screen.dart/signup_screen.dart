import 'dart:ui';

import 'package:e_commerce_app/commonwidgets/custom_button.dart';
import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:e_commerce_app/commonwidgets/custom_textformfield.dart';
import 'package:e_commerce_app/routes.dart/route_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  bool isValidEmail(String email) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(children: [
            // Background image
            Image.network(
              "https://images.pexels.com/photos/1839904/pexels-photo-1839904.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                color: Colors.white.withOpacity(0),
              ),
            ),
            Positioned(
                left: 20,
                top: MediaQuery.of(context).size.height / 4.5,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.normal,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Welcome to LUGA\n',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                      TextSpan(
                        text: "Let's create your account",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  // height: MediaQuery.of(context).size.height / 2,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17.0, vertical: 17),
                    child: Column(
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              letterSpacing: 0.5),
                        ),
                        sboxH20,
                        CustomTextFormField(
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          textInputType: TextInputType.emailAddress,
                          labelText: "User Name",
                          hintText: "Enter your username",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your user name';
                            }
                            if (!isValidEmail(value)) {
                              return 'Please enter a valid name';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        sboxH10,
                        CustomTextFormField(
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          textInputType: TextInputType.number,
                          labelText: "Phone Number",
                          hintText: "Enter your phone number",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            if (!isValidEmail(value)) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        sboxH10,
                        CustomTextFormField(
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          textInputType: TextInputType.emailAddress,
                          labelText: "Email",
                          hintText: "Enter your email",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!isValidEmail(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        sboxH10,
                        CustomTextFormField(
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          textInputType: TextInputType.visiblePassword,
                          labelText: "Password",
                          hintText: "Enter your password",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (!isValidEmail(value)) {
                              return 'Please enter a valid password';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        sboxH10,
                        CustomTextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          textInputType: TextInputType.visiblePassword,
                          labelText: "Confirm Password",
                          hintText: "Enter your password",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (!isValidEmail(value)) {
                              return 'Please enter a valid password';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        sboxH30,
                        Form(
                          key: formKey,
                          child: CustomButton(
                            title: "Sign Up",
                            buttonColor: const Color(0xFFB9D1C3),
                            textColor: Colors.white,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                Navigator.pushNamed(
                                    context, RouteConstants.routeOtp);
                              }
                            },
                          ),
                        ),
                        sboxH15,
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Or Continue With",
                              style: TextStyle(fontFamily: "Poppins"),
                            ),
                          ],
                        ),
                        sboxH10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/svgs/facebook.svg",
                              height: 24,
                              // ignore: deprecated_member_use
                              color: Colors.black,
                            ),
                            sboxW12,
                            SvgPicture.asset(
                              "assets/svgs/instagram.svg",
                              height: 24,
                              // ignore: deprecated_member_use
                              color: Colors.black,
                            ),
                            sboxW12,
                            SvgPicture.asset(
                              "assets/svgs/twitter.svg",
                              height: 24,
                              // ignore: deprecated_member_use
                              color: Colors.black,
                            ),
                          ],
                        ),
                        sboxH15,
                        Center(
                            child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.normal,
                            ),
                            children: <TextSpan>[
                              const TextSpan(text: 'Already have an account? '),
                              TextSpan(
                                  text: 'Sign In',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                          context, RouteConstants.routeLogin);
                                    }),
                            ],
                          ),
                        ))
                      ],
                    ),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
