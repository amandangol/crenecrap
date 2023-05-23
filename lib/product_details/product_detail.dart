import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:e_commerce_app/cubit/color_selection_cubit.dart';
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
  List<String>? itemsizes = ["S", 'M', 'L', 'XL'];
  List<Color>? itemcolors = [Colors.red, Colors.blue, Colors.purple];

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
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
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
                        sboxH10,
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
                        sboxH15,
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Sizes",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins"),
                                ),
                                sboxW10,
                                BlocBuilder<SizeSelectionCubit,
                                        SizeSelectionState>(
                                    builder: (context, sizeState) {
                                  final sizeSelectionCubit =
                                      context.read<SizeSelectionCubit>();
                                  return SizedBox(
                                    height: 30,
                                    child: ListView.builder(
                                      itemCount: itemsizes!.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final size = itemsizes![index];
                                        final isSelectedSize =
                                            size == sizeState.selectedSize;
                                        return GestureDetector(
                                          onTap: () {
                                            if (isSelectedSize) {
                                              context
                                                  .read<SizeSelectionCubit>()
                                                  .unselectSize();
                                            } else {
                                              context
                                                  .read<SizeSelectionCubit>()
                                                  .selectSize(size);
                                            }
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: isSelectedSize
                                                    ? Colors.black
                                                    : Colors.white,
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Text(
                                                  itemsizes![index],
                                                  style: TextStyle(
                                                    color: isSelectedSize
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }),
                                const Spacer(),
                                Text(
                                  "Rs. 2999",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                          ],
                        ),
                        sboxH15,
                        BlocBuilder<ColorSelectionCubit, ColorSelectionState>(
                            builder: (context, colorState) {
                          return Row(
                            children: [
                              Text(
                                "Colors",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins"),
                              ),
                              sboxW10,
                              SizedBox(
                                height: 30,
                                child: ListView.builder(
                                  itemCount: itemcolors!.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final color = itemcolors![index];
                                    final isSelectedColor =
                                        color == colorState.selectedColor;
                                    return GestureDetector(
                                      onTap: () {
                                        if (isSelectedColor) {
                                          context
                                              .read<ColorSelectionCubit>()
                                              .unselectColor();
                                        } else {
                                          context
                                              .read<ColorSelectionCubit>()
                                              .selectColor(color);
                                        }
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: itemcolors![index],
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5)),
                                        ),
                                        child: isSelectedColor
                                            ? const Icon(
                                                Icons.check,
                                                size: 20,
                                                color: Colors.white,
                                              )
                                            : const SizedBox(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        }),
                        Divider(
                          color: Colors.grey,
                          height: 30.h,
                        ),
                        Text(
                          "Product Overview",
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              fontSize: 15.sp),
                        ),
                        sboxH5,
                        Text(
                          "A type of garment typically made of soft and breathable fabric, such as cotton or polyester. It is a popular casual clothing item worn by people of all ages and genders. T-shirts are characterized by their short sleeves, crew neck or V-neck collar, and a loose-fitting style.",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: "Poppins",
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 12.sp),
                        ),
                        sboxH10,
                        const Divider(
                          color: Colors.grey,
                        ),
                        sboxH10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.shopping_bag_outlined,
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
                            Container(
                              height: 45,
                              width: 2,
                              decoration:
                                  const BoxDecoration(color: Colors.black),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Center(
                                child: Text(
                                  "Buy Now",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp),
                                ),
                              ),
                            )
                          ],
                        )
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
