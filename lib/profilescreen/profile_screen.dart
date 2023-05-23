import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:e_commerce_app/profilescreen/widgets/profile_menuitems.dart';
import 'package:e_commerce_app/routes.dart/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  List<String?> menuTitlelist = [
    "Personal Details",
    "My Order",
    "My Favourites",
    "Shipping Address",
    "My Card",
    "Settings"
  ];
  List<IconData?> iconData = [
    Icons.person_outlined,
    Icons.shopping_bag_outlined,
    Icons.favorite_outline,
    Icons.local_shipping_outlined,
    Icons.credit_card,
    Icons.settings
  ];
  List<String?> otherTitles = [
    "FAQs",
    "Privacy Policy",
    "Terms & Conditions",
  ];
  List<IconData?> otherIcons = [
    Icons.privacy_tip_outlined,
    Icons.verified_user_outlined,
    Icons.verified,
  ];

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
          "Account",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 17.sp),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(
                            0, 5), // changes the position of the shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Image.network(
                        "https://images.pexels.com/photos/4754648/pexels-photo-4754648.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    "Aman Dangol",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  ),
                  subtitle: Text(
                    "amand4ngol@gmail.com",
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              'Confirm',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins"),
                            ),
                            content: const Text(
                              'Are you sure you want to sign out?',
                              style: TextStyle(
                                  color: Colors.black, fontFamily: "Poppins"),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins"),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, RouteConstants.routeLogin),
                                child: const Text(
                                  'Sign out',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Icon(
                      Icons.logout_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              sboxH20,
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(
                            0, 5), // changes the position of the shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    border: Border.all(color: Colors.grey.withOpacity(0.3))),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  scrollDirection: Axis.vertical,
                  itemCount: menuTitlelist.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final icons = iconData[index];
                    final title = menuTitlelist[index];
                    return ProfileMenuItems(
                      icon: icons,
                      title: title,
                    );
                  },
                ),
              ),
              sboxH10,
              Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 5), // changes the position of the shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.3))),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      scrollDirection: Axis.vertical,
                      itemCount: otherTitles.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final otherIcon = otherIcons[index];
                        final otherTitle = otherTitles[index];
                        return ProfileMenuItems(
                          icon: otherIcon,
                          title: otherTitle,
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
