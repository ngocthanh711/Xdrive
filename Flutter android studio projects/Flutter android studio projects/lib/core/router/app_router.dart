import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phenikaaxdrive/features/customer_support/presentation/pages/customer_support.dart';
import 'package:phenikaaxdrive/features/rating/presentation/pages/rating.dart';
import 'package:phenikaaxdrive/features/navigation_bottom_bar/widget/navigation_widget.dart';
import 'package:phenikaaxdrive/features/profile/presentation/pages/profile_screen.dart';
import 'package:phenikaaxdrive/features/history/presentation/pages/history_screen.dart';
import 'package:phenikaaxdrive/features/trip_detail/presentation/pages/trip_detail_screen.dart';
import 'package:phenikaaxdrive/features/profile/presentation/pages/infor_update_screen.dart';
import 'package:phenikaaxdrive/features/profile/presentation/pages/payment_screen.dart';
import 'package:phenikaaxdrive/features/navigation_bottom_bar/widget/navigation_widget.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          PersistentBottomNavPage(), // Màn hình chính
    ),

    GoRoute(
      path: '/tripDetail',
      builder: (context, state) => TripDetail(), // Màn hình chính
    ),
    GoRoute(
      path: '/rating',
      builder: (context, state) => Rating(), // Màn hình chính
    ),
    GoRoute(
      path: '/history',
      builder: (BuildContext context, GoRouterState state) {
        return History();
      },
    ),
    GoRoute(
      path: '/support',
      builder: (BuildContext context, GoRouterState state) {
        return Support();
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) {
        return ProfileScreen();
      },
    ),
    GoRoute(
      path: '/profile/inforUpdate',
      builder: (BuildContext context, GoRouterState state) {
        return InformationUpdateScreen();
      },
    ),
    GoRoute(
      path: '/profile/payment',
      builder: (BuildContext context, GoRouterState state) {
        return PaymentScreen();
      },
    ),

    // GoRoute(
    //   path: '/tripDetail', // Route với tham số
    //   builder: (context, state) {
    //     final String tripId = state.pathParameters['id']!;
    //     return TripDetail();
    //   },
    // ),
  ],
);
