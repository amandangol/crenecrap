import 'package:e_commerce_app/cubit/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationAppBar extends StatelessWidget {
  const BottomNavigationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final size = MediaQuery.of(context).size;

    return BottomAppBar(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 8,
        ),
        child: BlocBuilder<BottomNavBarMenuChangeCubit, int>(
          builder: (context, menuIndex) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkResponse(
                  onTap: () {
                    context
                        .read<BottomNavBarMenuChangeCubit>()
                        .listenBottomNavBarMenuChange(0);
                    // context.router.push(NewsFeed());
                  },
                  splashColor: theme.colorScheme.secondary.withOpacity(0.4),
                  child: SizedBox(
                    height: 50.h,
                    //width: 30,
                    child: Row(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 30,
                          color: menuIndex == 0
                              ? const Color(0xFFB9D1C3)
                              : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                InkResponse(
                  onTap: () {
                    context
                        .read<BottomNavBarMenuChangeCubit>()
                        .listenBottomNavBarMenuChange(1);
                  },
                  splashColor: theme.colorScheme.secondary.withOpacity(0.4),
                  focusColor: theme.colorScheme.shadow,
                  hoverColor: theme.colorScheme.shadow,
                  child: SizedBox(
                    height: 50.h,
                    // width: 30,
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 30,
                      color: menuIndex == 1
                          ? const Color(0xFFB9D1C3)
                          : Colors.grey,
                    ),
                  ),
                ),
                InkResponse(
                  onTap: () async {
                    // context.router.push(Notificaton());
                    context
                        .read<BottomNavBarMenuChangeCubit>()
                        .listenBottomNavBarMenuChange(2);
                  },
                  splashColor: theme.colorScheme.secondary.withOpacity(0.4),
                  child: SizedBox(
                    height: 50.h,
                    child: Icon(
                      Icons.favorite_border_outlined,
                      size: 30,
                      color: menuIndex == 2
                          ? const Color(0xFFB9D1C3)
                          : Colors.grey,
                    ),
                  ),
                ),
                InkResponse(
                  onTap: () {
                    context
                        .read<BottomNavBarMenuChangeCubit>()
                        .listenBottomNavBarMenuChange(3);
                  },
                  splashColor: theme.colorScheme.secondary.withOpacity(0.4),
                  child: SizedBox(
                    height: 50.h,
                    child: Icon(
                      Icons.person_outline_outlined,
                      size: 30,
                      color: menuIndex == 3
                          ? const Color(0xFFB9D1C3)
                          : Colors.grey,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
