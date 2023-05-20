import 'package:e_commerce_app/categories_section/widgets/category_detail_item.dart';
import 'package:e_commerce_app/commonwidgets/custom_sizedbox.dart';
import 'package:e_commerce_app/cubit/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesDetailPage extends StatefulWidget {
  const CategoriesDetailPage({super.key});

  @override
  State<CategoriesDetailPage> createState() => _CategoriesDetailPageState();
}

class _CategoriesDetailPageState extends State<CategoriesDetailPage> {
  final SearchBloc _searchBloc = SearchBloc();

  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void dispose() {
    _searchBloc.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: StreamBuilder<bool>(
          stream: _searchBloc.searchStream,
          initialData: false,
          builder: (context, snapshot) {
            _isSearching = snapshot.data ?? false;
            if (_isSearching) {
              return TextField(
                autofocus: true,
                controller: _searchController,
                decoration: const InputDecoration(
                    hintText: 'Search',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey), // Change the color here
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey), // Change the color here
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 0)),
              );
            } else {
              return Text(
                'Products',
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              );
            }
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              _isSearching ? Icons.close : Icons.search,
              color: Colors.black,
            ),
            onPressed: () async {
              if (_isSearching) {
                _searchBloc.stopSearch();
              } else {
                _searchBloc.startSearch();
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          sboxH10,
          Expanded(
            child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 8.0, // Spacing between each column
                  mainAxisSpacing: 8.0, // Spacing between each row
                ),
                children: const [
                  CategoryDetailItem(
                    image:
                        "https://images.pexels.com/photos/2081199/pexels-photo-2081199.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    title: "The Marc Jacobs",
                    subtitle: "Traveler Tote",
                    price: "Rs. 2999",
                  ),
                  CategoryDetailItem(
                    image:
                        "https://images.pexels.com/photos/3661622/pexels-photo-3661622.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    title: "Gucci Gucci",
                    subtitle: "One and only",
                    price: "Rs. 3999",
                  ),
                  CategoryDetailItem(
                    image:
                        "https://images.pexels.com/photos/1639729/pexels-photo-1639729.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    title: "Brocade",
                    subtitle: "Traveler Tote",
                    price: "Rs. 5999",
                  ),
                  CategoryDetailItem(
                    image:
                        "https://images.pexels.com/photos/934070/pexels-photo-934070.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    title: "The Marc Jacobs",
                    subtitle: "Traveler Tote",
                    price: "Rs. 4099",
                  ),
                  CategoryDetailItem(
                    image:
                        "https://images.pexels.com/photos/3661622/pexels-photo-3661622.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    title: "Gucci Gucci",
                    subtitle: "One and only",
                    price: "Rs. 3999",
                  ),
                  CategoryDetailItem(
                    image:
                        "https://images.pexels.com/photos/1639729/pexels-photo-1639729.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    title: "Brocade",
                    subtitle: "Traveler Tote",
                    price: "Rs. 5999",
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
