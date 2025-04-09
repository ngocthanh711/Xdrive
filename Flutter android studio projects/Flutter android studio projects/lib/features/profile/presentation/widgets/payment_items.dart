import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentItem extends StatelessWidget {
  final String pngIcon;
  final String title;
  final String path;
  final bool isActived; // New property


  const PaymentItem({
    super.key,
    required this.pngIcon,
    required this.title,
    required this.path,
    this.isActived = true,  // Default value is true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xffCAD1E4), width: 1),
      ),
      child: ListTile(
        leading: Image.asset(
          pngIcon,
          width: 24,
          height: 24,
          fit: BoxFit.cover,
          alignment: Alignment.centerLeft,
        ),
        title: Text(
          title,
          style:  GoogleFonts.interTight(
            color: Color(0xff0C215C),
            fontWeight: FontWeight.w600,
            height: 1.5,
            fontSize: 16,
          ),
        ),
        trailing: isActived ? Container( // Conditional rendering
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/svg/plus.svg'),
                  SizedBox(width: 8),
                  Text(
                    'Thêm',
                    style: GoogleFonts.interTight(
                      color: Color(0xffEC6935),
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      fontSize: 16,
                    ),
                  ),
                ]
            )
        ) : null, // If isActived is false, show nothing
        onTap: () {
          context.push(path);
        },
      ),
    );
  }
}