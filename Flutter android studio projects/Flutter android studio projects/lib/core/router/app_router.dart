
import 'package:go_router/go_router.dart';
import 'package:phenikaaxdrive/features/customer_support/presentation/pages/customer_support.dart';
import 'package:phenikaaxdrive/features/rating/presentation/pages/rating.dart';
import 'package:phenikaaxdrive/features/navigation_bottom_bar/widget/navigation_widget.dart';
import 'package:phenikaaxdrive/features/profile/presentation/pages/profile_screen.dart';
import 'package:phenikaaxdrive/features/history/presentation/pages/history_screen.dart';
import 'package:phenikaaxdrive/features/trip_detail/presentation/pages/trip_detail_screen.dart';
import 'package:phenikaaxdrive/features/profile/presentation/pages/infor_update_screen.dart';
import 'package:phenikaaxdrive/features/profile/presentation/pages/payment_screen.dart';
import 'package:phenikaaxdrive/features/profile/presentation/pages/liked_location_screen.dart';
import 'package:phenikaaxdrive/features/profile/presentation/pages/private_setting.dart';
import 'package:phenikaaxdrive/features/profile/presentation/pages/notification_setting.dart';
import 'package:phenikaaxdrive/features/profile/presentation/pages/language.dart';
import 'package:phenikaaxdrive/features/profile/presentation/pages/test.dart';


final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          PersistentBottomNavPage(), // Màn hình chính
    ),

    GoRoute(
      path: '/tripDetail',
      builder: (context, state) => TripDetail(),
    ),
    GoRoute(
      path: '/rating',
      builder: (context, state) => Rating(),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => History(),
    ),
    GoRoute(
      path: '/support',
      builder: (context, state) => Support(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: '/profile/inforUpdate',
      builder: (context, state) => InformationUpdateScreen(),
    ),
    GoRoute(
      path: '/profile/payment',
      builder: (context, state) => PaymentScreen(),
    ),
    GoRoute(
      path: '/profile/likedLocation',
      builder: (context, state) => LikedLocationScreen(),
    ),
    GoRoute(
      path: '/profile/privateSetting',
      builder: (context, state) => PrivateSetting(),
    ),
    GoRoute(
      path: '/profile/notification_setting',
      builder: (context, state) => NotificationSettingScreen(),
    ),
    GoRoute(
      path: '/profile/language_setting',
      builder: (context, state) => LanguageSelectionScreen(),
    ),
    GoRoute(
      path: '/profile/test',
      builder: (context, state) => Tess(),
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
