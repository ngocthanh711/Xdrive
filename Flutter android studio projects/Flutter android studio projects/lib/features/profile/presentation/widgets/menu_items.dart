import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';


class MenuItem extends StatelessWidget {
  final String svgIcon;
  final String title;
  final String path; // Thay đổi từ Widget screen thành String path

  const MenuItem({
    super.key,
    required this.svgIcon,
    required this.title,
    required this.path, // Sử dụng path thay vì screen
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        svgIcon,
        width: 24,
        height: 24,
        fit: BoxFit.cover,
        alignment: Alignment.centerLeft,
      ),
      title: Text(
        title,
        style:  GoogleFonts.interTight(
          color: Color(0xff0C215C),
          fontWeight: FontWeight.w500,
          height: 1.5,
          fontSize: 16,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        context.push(path);
      },
    );
  }
}