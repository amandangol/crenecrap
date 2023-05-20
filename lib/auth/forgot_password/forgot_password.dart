import 'package:e_commerce_app/commonwidgets/custom_button.dart';
import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:e_commerce_app/commonwidgets/custom_textformfield.dart';
import 'package:e_commerce_app/routes.dart/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 17.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      sboxH30,
                      Text(
                        "Forgotten Password",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      sboxH10,
                      Text(
                        "Please enter your e-mail here to send you a\ncode to reset your password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 25),
                        child: Image.asset(
                          "assets/images/pwvector.jpg",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      sboxH10,
                      CustomTextFormField(
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        labelText: "Email",
                        hintText: "abcd@gmail.com",
                        validator: (value) {
                          return null;
                        },
                        onSaved: (value) {},
                      ),
                      sboxH20,
                      CustomButton(
                        title: "Send code",
                        buttonColor: const Color(0xFFB9D1C3),
                        textColor: Colors.white,
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteConstants.routeLogin);
                        },
                      ),
                      // Padding(
                      //     padding: EdgeInsets.only(
                      //         bottom:
                      //             MediaQuery.of(context).viewInsets.bottom)),
                      sboxH15,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.refresh_outlined),
                          sboxW6,
                          const Text(
                            "Resend code",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
