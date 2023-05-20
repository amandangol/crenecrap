import 'package:e_commerce_app/commonwidgets/custom_button.dart';
import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:e_commerce_app/routes.dart/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});
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
          child: Container(
            // height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sboxH30,
                  Text(
                    "Verification Code",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  sboxH10,
                  Text(
                    "Please check your e-mail and\nenter the code down here",
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
                      "assets/images/otpvector.jpg",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Pinput(
                    controller: pinController,
                    // androidSmsAutofillMethod:
                    //     AndroidSmsAutofillMethod.smsRetrieverApi,
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    length: 5,
                    closeKeyboardWhenCompleted: true,
                    pinAnimationType: PinAnimationType.rotation,
                    onCompleted: (val) {},
                  ),
                  sboxH40,
                  CustomButton(
                    title: "Confirm",
                    buttonColor: const Color(0xFFB9D1C3),
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.pushNamed(context, RouteConstants.routeLogin);
                    },
                  ),
                  sboxH15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.refresh_outlined),
                      sboxW6,
                      const Text(
                        "Resend code",
                        style: TextStyle(
                            fontFamily: "Poppins", fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
