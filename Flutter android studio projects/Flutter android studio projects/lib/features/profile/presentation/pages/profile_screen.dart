import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/profile_bloc.dart';
import '../blocs/profile_state.dart';
import 'package:phenikaaxdrive/features/rating/presentation/pages/rating.dart';
import 'package:phenikaaxdrive/features/profile/presentation/widgets/profile_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6E0F0), // Màu nền xanh nhạt
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
              print("Edit profile tapped!");
            },
          ),

          SizedBox(height: 16),

          // Danh sách menu
          Container(
            padding: EdgeInsets.all(16),
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
                _buildMenuItem(
                  context,
                  'assets/svg/wallet.svg',
                  "Phương thức thanh toán",
                  Rating(),
                ),
                _buildMenuItem(
                  context,
                  'assets/svg/location.svg',
                  "Địa điểm yêu thích",
                  Rating(),
                ),
                _buildMenuItem(
                  context,
                  'assets/svg/setting.svg',
                  "Tùy chỉnh riêng tư",
                  Rating(),
                ),
                _buildMenuItem(
                  context,
                  'assets/svg/bell.svg',
                  "Cấu hình thông báo",
                  Rating(),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          Container(
            padding: EdgeInsets.all(16),
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
                _buildMenuItem(
                  context,
                  'assets/svg/document.svg',
                  "Điều khoản & Chính sách",
                  Rating(),
                ),
                _buildMenuItem(
                  context,
                  'assets/svg/globe.svg',
                  "Ngôn ngữ",
                  Rating(),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          Container(
            padding: EdgeInsets.all(16),
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
                _buildMenuItem(
                  context,
                  'assets/svg/key.svg',
                  "Đổi mật khẩu",
                  Rating(),
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/svg/Sign_out.svg',
                    width: 24, // Kích thước icon
                    height: 24,
                  ),
                  title: Text(
                    'Đăng xuất',
                    style: TextStyle(
                      color: Color(0xffFB2C36),
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Xử lý khi nhấn vào menu
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

Widget _buildMenuItem(
  BuildContext context,
  String svgIcon,
  String title,
  Widget screen,
) {
  return ListTile(
    leading: SvgPicture.asset(
      svgIcon,
      width: 24, // Kích thước icon
      height: 24,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: Color(0xff0C215C),
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: 16,
      ),
    ),
    trailing: Icon(Icons.arrow_forward_ios, size: 16),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    },
  );
}
