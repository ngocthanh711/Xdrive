import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAvatar extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String phone;
  final VoidCallback onEditPressed;

  const ProfileAvatar({
    Key? key,
    required this.avatarUrl,
    required this.name,
    required this.phone,
    required this.onEditPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(avatarUrl),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.interTight(
                  color: Color(0xff0C215C),
                  fontWeight: FontWeight.w600,
                  height: 1.33333,
                  fontSize: 24,
                ),
              ),
              Text(
                phone,
                style: GoogleFonts.interTight(
                  color: Color(0xff909AB1),
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xffDAE4FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: onEditPressed,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: SvgPicture.asset('assets/svg/edit.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
