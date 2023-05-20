import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:e_commerce_app/cubit/order_add_remove_cubit.dart';
import 'package:e_commerce_app/cubit/size_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});
  List<String>? imgList = [
    "https://images.pexels.com/photos/428338/pexels-photo-428338.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/428311/pexels-photo-428311.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/1861907/pexels-photo-1861907.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: height / 2,
                      aspectRatio: 1.5,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: 1,
                      autoPlay: false,
                    ),
                    items: imgList!
                        .map((item) => Center(
                                child: Image.network(
                              item,
                              fit: BoxFit.cover,
                              height: height / 2,
                              width: double.infinity,
                            )))
                        .toList(),
                  ),
                  Positioned(
                      left: 20,
                      top: 20,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                            ),
                          ))),
                  Positioned(
                      right: 20,
                      top: 20,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.black,
                            ),
                          ))),
                  Positioned(
                      right: 20,
                      bottom: 20,
                      child: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: IconButton(
                            iconSize: 20,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.black,
                            ),
                          ))),
                ],
              ),
              sboxH10,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7.0, vertical: 1),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Roller Rabbit",
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 0.5,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins"),
                            ),
                            BlocBuilder<OrderAddRemoveCubit, int>(
                                builder: (context, quantity) {
                              final shoppingCartBloc =
                                  context.read<OrderAddRemoveCubit>();
                              return Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(24)),
                                child: Row(
                                  children: [
                                    IconButton(
                                        iconSize: 20,
                                        onPressed: () {
                                          shoppingCartBloc.decrementQuantity();
                                        },
                                        icon: const Icon(Icons.remove)),
                                    Text(
                                      quantity.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        iconSize: 20,
                                        onPressed: () {
                                          shoppingCartBloc.incrementQuantity();
                                        },
                                        icon: const Icon(Icons.add)),
                                  ],
                                ),
                              );
                            })
                          ],
                        ),
                        Text(
                          "Vado Odeilla Dress",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Poppins"),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const Text("(320 Review)"),
                            const Spacer(),
                            Text(
                              "Available in Stock",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins"),
                            )
                          ],
                        ),
                        sboxH10,
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Size",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins"),
                                ),
                                sboxH15,
                                BlocBuilder<SizeSelectionCubit,
                                        SizeSelectionState>(
                                    builder: (context, sizeState) {
                                  final sizeSelectionCubit =
                                      context.read<SizeSelectionCubit>();
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (sizeState ==
                                              SizeSelectionState.initial) {
                                            sizeSelectionCubit.selectSize();
                                          } else {
                                            sizeSelectionCubit.resetSize();
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: sizeState ==
                                                      SizeSelectionState
                                                          .selected
                                                  ? Colors.black
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "S",
                                              style: TextStyle(
                                                color: sizeState ==
                                                        SizeSelectionState
                                                            .selected
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      sboxW6,
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "M",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      sboxW6,
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "L",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      sboxW6,
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "XL",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      sboxW6,
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "XXL",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(24)),
                                color: Colors.blue.withOpacity(0.1),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                            color:
                                                Colors.grey.withOpacity(0.5))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.check,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  sboxH5,
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                        border: Border.all(
                                            color:
                                                Colors.grey.withOpacity(0.5))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.check,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  sboxH5,
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                        border: Border.all(
                                            color:
                                                Colors.grey.withOpacity(0.5))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.check,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Description",
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              fontSize: 15.sp),
                        ),
                        sboxH10,
                        Text(
                          "A type of garment typically made of soft and breathable fabric, such as cotton or polyester. It is a popular casual clothing item worn by people of all ages and genders. T-shirts are characterized by their short sleeves, crew neck or V-neck collar, and a loose-fitting style.",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: "Poppins",
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 12.sp),
                        ),
                        sboxH10,
                        Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rs. 1199.00",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins"),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.shopping_bag_outlined,
                                              color: Colors.black),
                                          sboxW6,
                                          Text(
                                            "Add to cart",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                    sboxH10,
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      child: Text(
                                        "Buy Now",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ))
                        // Container(
                        // decoration: const BoxDecoration(
                        //   color: Colors.black,
                        //   borderRadius: BorderRadius.all(Radius.circular(24)),
                        // ),
                        //   child: ListTile(
                        //     title: Text(
                        //       "Total Price",
                        //       style: TextStyle(
                        //           fontFamily: "Poppins", fontSize: 12.sp),
                        //     ),
                        // subtitle: Text(
                        //   "Rs. 1199.00",
                        //   style: TextStyle(
                        //       fontSize: 17.sp,
                        //       color: Colors.black,
                        //       fontWeight: FontWeight.bold,
                        //       fontFamily: "Poppins"),
                        // ),
                        //     trailing: Container(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 15, vertical: 8),
                        //       decoration: const BoxDecoration(
                        //         color: Colors.black,
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(24)),
                        //       ),
                        //       child: Row(
                        //         children: [
                        //           const Icon(Icons.shopping_bag_outlined,
                        //               color: Colors.white),
                        //           sboxW6,
                        // Text(
                        //   "Add to cart",
                        //   style: TextStyle(
                        //       fontFamily: "Poppins",
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 16.sp),
                        // )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
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
