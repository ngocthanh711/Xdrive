import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phenikaaxdrive/core/router/app_router.dart';
import 'package:phenikaaxdrive/features/customer_support/presentation/pages/customer_support.dart';
import 'package:phenikaaxdrive/features/rating/presentation/pages/rating.dart';
import 'package:phenikaaxdrive/features/navigation_bottom_bar/widget/navigation_widget.dart';
import 'package:phenikaaxdrive/features/profile/presentation/pages/profile_screen.dart';
import 'package:phenikaaxdrive/features/history/presentation/pages/history_screen.dart';
import 'package:phenikaaxdrive/features/trip_detail/presentation/pages/trip_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter, // Sử dụng GoRouter
    );
  }
}

