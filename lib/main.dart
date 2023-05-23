import 'package:e_commerce_app/cubit/bottom_navigation_cubit.dart';
import 'package:e_commerce_app/cubit/color_selection_cubit.dart';
import 'package:e_commerce_app/cubit/order_add_remove_cubit.dart';
import 'package:e_commerce_app/cubit/remember_me_cubit.dart';
import 'package:e_commerce_app/cubit/size_selection_cubit.dart';
import 'package:e_commerce_app/routes.dart/custom_route.dart';
import 'package:e_commerce_app/routes.dart/routes.dart';
import 'package:e_commerce_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const EcommerceMain());
}

class EcommerceMain extends StatelessWidget {
  const EcommerceMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => BottomNavBarMenuChangeCubit(),
        ),
        BlocProvider(
          create: (ctx) => CheckBoxCubit(),
        ),
        BlocProvider(
          create: (ctx) => OrderAddRemoveCubit(),
        ),
        BlocProvider(
          create: (ctx) => SizeSelectionCubit(),
        ),
        BlocProvider(
          create: (ctx) => ColorSelectionCubit(),
        ),
      ],
      child: ScreenUtilInit(builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          onGenerateRoute: generateRoute,
          onGenerateInitialRoutes: (pastRoute) {
            return [
              CustomPageRouteBuilder(
                widget: const SplashAnimationScreen(),
              )
            ];
          },
        );
      }),
    );
  }
}

// class EcommerceMain extends StatefulWidget {
//   const EcommerceMain({super.key, this.title});

//   final String? title;

//   @override
//   State<EcommerceMain> createState() => _EcommerceMainState();
// }

// class _EcommerceMainState extends State<EcommerceMain> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (ctx) => BottomNavBarMenuChangeCubit(),
//         ),
//         BlocProvider(
//           create: (ctx) => CheckBoxCubit(),
//         ),
//       ],
//       child: ScreenUtilInit(builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(primarySwatch: Colors.blue),
//           onGenerateRoute: generateRoute,
//           onGenerateInitialRoutes: (pastRoute) {
//             return [
//               CustomPageRouteBuilder(
//                 widget: const SplashAnimationScreen(),
//               )
//             ];
//           },
//         );
//       }),
//     );
//   }
// }
