import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:e_commerce_app/cubit/order_add_remove_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartItem extends StatelessWidget {
  String? productName;
  String? productSubtitle;
  String? quantity;
  String? size;
  Color? color;
  String? productImage;
  String? price;
  MyCartItem({
    this.productName,
    this.productSubtitle,
    this.color,
    this.quantity,
    this.size,
    super.key,
    this.price,
    this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset:
                    const Offset(0, 5), // changes the position of the shadow
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: productImage?.isEmpty ?? true
                    ? const Placeholder(
                        fallbackHeight: 100,
                        fallbackWidth: 100,
                      )
                    : Image.network(
                        productImage!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
              ),
              sboxW10,
              Flexible(
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        productSubtitle!,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp),
                      ),
                      Text(
                        "Quantity: $quantity",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.normal,
                            fontSize: 13.sp),
                      ),
                      Text(
                        "Size: $size",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp),
                      ),
                      Row(
                        children: [
                          Text(
                            "Color: ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.normal,
                                fontSize: 12.sp),
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: color,
                                border: Border.all(color: Colors.grey)),
                          ),
                        ],
                      ),
                      Text(
                        "Rs. $price",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<OrderAddRemoveCubit, int>(
                  builder: (context, quantity) {
                final shoppingCartBloc = context.read<OrderAddRemoveCubit>();
                return Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          shoppingCartBloc.decrementQuantity();
                        },
                        child: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                      sboxW6,
                      Text(
                        quantity.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold),
                      ),
                      sboxW6,
                      GestureDetector(
                        onTap: () {
                          shoppingCartBloc.incrementQuantity();
                        },
                        child: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
