import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/profile_bloc.dart';
import '../blocs/profile_state.dart';
import 'package:phenikaaxdrive/features/rating/presentation/pages/rating.dart';
import 'package:phenikaaxdrive/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:phenikaaxdrive/features/profile/presentation/widgets/menu_items.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F4FF),
      body: Column(
        children: [
          // Ảnh cover
          Image.asset('assets/images/profile_banner.png', fit: BoxFit.cover),
          // Thông tin cá nhân
          ProfileAvatar(
            avatarUrl: 'assets/images/avatar.png',
            name: 'Nguyễn Văn A',
            phone: '+8427402748',
            onEditPressed: () {
              // Xử lý khi nhấn vào chỉnh sửa
              context.push('/profile/inforUpdate');
            },
          ),

          SizedBox(height: 16),

          // Danh sách menu
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(137, 153, 203, 0.24),
                  // rgba(137, 153, 203, 0.24)
                  offset: Offset(0, 4),
                  blurRadius: 16,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                MenuItem(
                  svgIcon: 'assets/svg/wallet.svg',
                  title: "Phương thức thanh toán",
                  path: '/profile/payment'
                ),

                MenuItem(
                  svgIcon: 'assets/svg/location.svg',
                  title: "Địa điểm yêu thích",
                  path: '/rating'
                ),

                MenuItem(
                  svgIcon: 'assets/svg/setting.svg',
                  title: "Tùy chỉnh riêng tư",
                  path: '/rating'
                ),

                MenuItem(
                  svgIcon: 'assets/svg/bell.svg',
                  title: "Cấu hình thông báo",
                  path: '/rating'
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(137, 153, 203, 0.24),
                  // rgba(137, 153, 203, 0.24)
                  offset: Offset(0, 4),
                  blurRadius: 16,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                MenuItem(
                  svgIcon: 'assets/svg/document.svg',
                  title: "Điều khoản & Chính sách",
                  path: '/rating'
                ),

                MenuItem(
                  svgIcon: 'assets/svg/globe.svg',
                  title: "Ngôn ngữ",
                  path: '/rating'
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(137, 153, 203, 0.24),
                  // rgba(137, 153, 203, 0.24)
                  offset: Offset(0, 4),
                  blurRadius: 16,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                MenuItem(
                  svgIcon: 'assets/svg/key2.svg',
                  title: "Đổi mật khẩu",  //nó đang bị lỗi file SVG
                  path: '/rating'
                ),

                ListTile(
                  leading: SvgPicture.asset(
                    'assets/svg/sign_out.svg',
                    width: 24, // Kích thước icon
                    height: 24,
                    fit: BoxFit.contain, // Điều chỉnh kích thước icon cho đồng đều
                    alignment: Alignment.centerLeft, // Căn trái icon
                  ),
                  title: Text(
                    'Đăng xuất',
                    style: GoogleFonts.interTight(
                      color: Color(0xffFB2C36),
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    _handleLogout(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


void _handleLogout(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Đăng xuất"),
        content: Text("Bạn có chắc chắn muốn đăng xuất không?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Hủy"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Thực hiện xử lý đăng xuất tại đây
              print("User logged out!");
            },
            child: Text("Đăng xuất"),
          ),
        ],
      );
    },
  );
}


