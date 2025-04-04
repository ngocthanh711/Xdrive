import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:phenikaaxdrive/features/customer_support/presentation/pages/customer_support.dart';
import 'package:phenikaaxdrive/features/profile/presentation/pages/profile_screen.dart';
import 'package:phenikaaxdrive/features/history/presentation/pages/history_screen.dart';
import 'package:google_fonts/google_fonts.dart';

// =================== MODEL CHO TABS ===================
class PersistentTabItem {
  final Widget tab;
  final GlobalKey<NavigatorState>? navigatorkey;
  final String title;
  final String icon;
  final String activedIcon;

  PersistentTabItem({
    required this.tab,
    this.navigatorkey,
    required this.title,
    required this.icon,
    required this.activedIcon,
  });
}


Widget _customIcon(String assetName, {bool isActive = false}) {
  return SizedBox(width: 24, height: 24, child: SvgPicture.asset(assetName));
}

class PersistentBottomNavPage extends StatelessWidget {
  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();
  final _tab3navigatorKey = GlobalKey<NavigatorState>();
  final _tab4navigatorKey = GlobalKey<NavigatorState>();

  PersistentBottomNavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentBottomBarScaffold(
      items: [
        PersistentTabItem(
          tab: const TabPage1(),
          icon: 'assets/svg/car.svg',
          activedIcon: 'assets/svg/selected_car.svg',
          title: 'Đặt xe',
          navigatorkey: _tab1navigatorKey,
        ),
        PersistentTabItem(
          tab: const TabPage2(),
          icon: 'assets/svg/history.svg',
          activedIcon: 'assets/svg/selected_history.svg',
          title: 'Lịch sử',
          navigatorkey: _tab2navigatorKey,
        ),
        PersistentTabItem(
          tab: const TabPage3(),
          icon: 'assets/svg/support.svg',
          activedIcon: 'assets/svg/selected_support.svg',
          title: 'Hỗ trợ',
          navigatorkey: _tab3navigatorKey,
        ),
        PersistentTabItem(
          tab: const TabPage4(),
          icon: 'assets/svg/account.svg',
          activedIcon: 'assets/svg/selected_account.svg',
          title: 'Tài khoản',
          navigatorkey: _tab4navigatorKey,
        ),
      ],
    );
  }
}

class TabPage1 extends StatelessWidget {
  const TabPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildTabPage(context, 'Home', Colors.blue);
  }
}

class TabPage2 extends StatelessWidget {
  const TabPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: History(),
    );
  }
}

class TabPage3 extends StatelessWidget {
  const TabPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Support(),
    );
  }
}

class TabPage4 extends StatelessWidget {
  const TabPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

// =================== CHUNG GIAO DIỆN CÁC TAB ===================
Widget _buildTabPage(BuildContext context, String title, Color color) {
  return Scaffold(
    appBar: AppBar(title: Text(title), backgroundColor: color),
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailPage(title: title)),
          );
        },
        child: Text('Go to $title Detail'),
      ),
    ),
  );
}

// =================== TRANG CHI TIẾT ===================
class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$title Detail')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}


// =================== BOTTOM NAVIGATION BAR ===================
class PersistentBottomBarScaffold extends StatefulWidget {
  final List<PersistentTabItem> items;

  const PersistentBottomBarScaffold({Key? key, required this.items})
      : super(key: key);

  @override
  State<PersistentBottomBarScaffold> createState() =>
      _PersistentBottomBarScaffoldState();
}

class _PersistentBottomBarScaffold extends StatefulWidget {
  final List<PersistentTabItem> items;

  const _PersistentBottomBarScaffold({Key? key, required this.items})
      : super(key: key);

  @override
  State<PersistentBottomBarScaffold> createState() =>
      _PersistentBottomBarScaffoldState();
}

class _PersistentBottomBarScaffoldState
    extends State<PersistentBottomBarScaffold> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    // Danh sách các tuyến đường mà bạn muốn ẩn thanh điều hướng
    final List<String> hiddenRoutes = [
      '/rating',
      '/trip_detail'
    ]; // Thêm các tuyến đường khác nếu cần

    return WillPopScope(
      onWillPop: () async {
        if (widget.items[_selectedTab].navigatorkey?.currentState?.canPop() ??
            false) {
          widget.items[_selectedTab].navigatorkey?.currentState?.pop();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedTab,
          children: widget.items.map((page) {
            return Navigator(
              key: page.navigatorkey,
              onGenerateInitialRoutes: (_, __) {
                return [MaterialPageRoute(builder: (context) => page.tab)];
              },
            );
          }).toList(),
        ),
        bottomNavigationBar: Builder(
          builder: (context) {
            final location = GoRouterState.of(context).uri.toString();
            if (hiddenRoutes.contains(location)) {
              return SizedBox.shrink(); // Trả về một Widget rỗng thay vì null
            }
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF8999CB).withOpacity(0.24),
                    blurRadius: 16,
                    spreadRadius: 0,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                currentIndex: _selectedTab,
                onTap: (index) {
                  setState(() {
                    _selectedTab = index;
                  });
                },
                unselectedItemColor: Colors.grey,
                unselectedLabelStyle: GoogleFonts.interTight(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.42857,
                ),
                selectedLabelStyle: GoogleFonts.interTight(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.42857,
                ),
                type: BottomNavigationBarType.fixed,
                iconSize: 40,
                selectedFontSize: 14,
                unselectedFontSize: 14,
                items: widget.items
                    .map(
                      (item) => BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 40,
                      height: 40,
                      child: SvgPicture.asset(
                        _selectedTab == widget.items.indexOf(item)
                            ? item.activedIcon
                            : item.icon,
                        key: ValueKey(_selectedTab ==
                            widget.items.indexOf(item)
                            ? item.activedIcon
                            : item.icon), // Thêm ValueKey
                      ),
                    ),
                    label: item.title,
                  ),
                )
                    .toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}

