import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListItems extends StatelessWidget {
  final String? productName;
  final String? productSubtitle;
  final String? productImage;
  final String? price;
  const WishListItems({
    super.key,
    this.productName,
    this.productSubtitle,
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Flexible(
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                        sboxH20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rs. $price",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                            ),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                                child: Text(
                                  "Add to cart",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )

              // Expanded(
              //   child: ListTile(
              //     contentPadding: const EdgeInsets.all(0),
              // title: Text(
              //   productName!,
              //   overflow: TextOverflow.ellipsis,
              //   maxLines: 1,
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontFamily: "Poppins",
              //       fontWeight: FontWeight.bold,
              //       fontSize: 14.sp),
              // ),
              //     subtitle: Text(
              //       overflow: TextOverflow.ellipsis,
              //       productSubtitle!,
              //       maxLines: 1,
              //       style: TextStyle(
              //           color: Colors.grey,
              //           fontFamily: "Poppins",
              //           fontWeight: FontWeight.normal,
              //           fontSize: 12.sp),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
