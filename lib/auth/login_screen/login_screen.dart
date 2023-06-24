import 'dart:ui';

import 'package:e_commerce_app/commonwidgets/custom_button.dart';
import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:e_commerce_app/commonwidgets/custom_textformfield.dart';
import 'package:e_commerce_app/cubit/remember_me_cubit.dart';
import 'package:e_commerce_app/routes.dart/route_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  bool isValidEmail(String email) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    // ignore: unused_local_variable
    String email;
    // ignore: unused_local_variable
    String password;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Stack(children: [
          // Background image
          Image.network(
            "https://images.pexels.com/photos/1839904/pexels-photo-1839904.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            fit: BoxFit.cover,
            // width: double.infinity,
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
              top: MediaQuery.of(context).size.height / 2.5,
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
                      text: 'Welcome\n',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                    TextSpan(
                      text: "Your favourite brands are waiting for you",
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
                        "Sign in",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            letterSpacing: 0.5),
                      ),
                      sboxH20,
                      CustomTextFormField(
                        autoFocus: false,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        textInputType: TextInputType.emailAddress,
                        labelText: "Email",
                        hintText: "abcd@gmail.com",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!isValidEmail(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email = value!;
                        },
                      ),
                      sboxH10,
                      CustomTextFormField(
                        autoFocus: false,
                        obscureText: true,
                        textInputType: TextInputType.visiblePassword,
                        labelText: "Password",
                        hintText: "*******",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (!isValidEmail(value)) {
                            return 'Please enter a valid password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          password = value!;
                        },
                      ),
                      sboxH5,
                      BlocBuilder<CheckBoxCubit, bool>(
                          builder: (context, state) {
                        return Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.black,
                              value: state,
                              onChanged: (value) {
                                context
                                    .read<CheckBoxCubit>()
                                    .toggleCheckbox(value!);
                              },
                            ),
                            Text(
                              "Remember me",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteConstants.routeForgotPw);
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        );
                      }),
                      sboxH30,
                      Form(
                        key: formKey,
                        child: CustomButton(
                          title: "Login",
                          buttonColor: const Color(0xFFB9D1C3),
                          textColor: Colors.white,
                          onTap: () {
                            // if (formKey.currentState!.validate())
                            {
                              // formKey.currentState!.save();
                              Navigator.pushNamed(
                                  context, RouteConstants.routeHome);
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
                            const TextSpan(text: 'Dont have an account? '),
                            TextSpan(
                                text: 'Sign Up',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, RouteConstants.routeSignup);
                                  }),
                          ],
                        ),
                      ))
                    ],
                  ),
                )),
          ),
        ])),
      ),
    );
  }
}
