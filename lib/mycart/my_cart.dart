import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:e_commerce_app/mycart/widgets/mycart_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCart extends StatelessWidget {
  MyCart({super.key});

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
  List<Color?> color = [Colors.red, Colors.blue, Colors.orange, Colors.pink];
  List<String?> size = ["M", "S", "M"];
  List<String?> quantity = ["1", "1", "2"];

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
          "My Cart",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 17.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 80.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: productName.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final items = productName[index];
                  return Dismissible(
                    key: const Key("items"),
                    direction: DismissDirection.endToStart,
                    background: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Container(
                        alignment: Alignment.centerRight,
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
                            color: Colors.black,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    confirmDismiss: (direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirm'),
                            content: const Text(
                                'Are you sure you want to delete this item?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onDismissed: (direction) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor: Colors.redAccent,
                            content: Text('$items is removed from the cart')),
                      );
                    },
                    child: MyCartItem(
                      productImage: (index >= 0 && index < productImage!.length)
                          ? productImage![index]
                          : "",
                      color: (index >= 0 && index < color.length)
                          ? color[index]
                          : null,
                      price: (index >= 0 && index < price.length)
                          ? price[index]
                          : "",
                      productName: (index >= 0 && index < productName.length)
                          ? productName[index]
                          : "",
                      productSubtitle:
                          (index >= 0 && index < productSubtitle.length)
                              ? productSubtitle[index]
                              : "",
                      quantity: (index >= 0 && index < quantity.length)
                          ? quantity[index]
                          : "",
                      size: (index >= 0 && index < size.length)
                          ? size[index]
                          : "",
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total(3 items):",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp),
                      ),
                      Text(
                        "Rs. 500",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ),
                    ],
                  ),
                  sboxH10,
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Proceed to Checkout",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.normal,
                              fontSize: 16.sp),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.arrow_forward),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
