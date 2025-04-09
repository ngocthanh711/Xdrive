import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Future<Object?> showRemoveLocationDialog( // Changed return type to Future<Object?>
    BuildContext context, int index, Function(int) onRemove) async {
  return showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(24.0),
          child: Material( // Sử dụng Material để có nền và shadow mặc định
            color: Colors.transparent, // Để màu nền của Container hiển thị
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    SvgPicture.asset('assets/svg/triangle_warning.svg'),
                    const SizedBox(height: 16),
                    Text(
                      'Bạn có chắc chắn muốn xóa địa chỉ này. Địa chỉ sẽ không còn hiển thị trong danh sách địa chỉ đã lưu.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.interTight(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: const Color(0xFF0C215C),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(buildContext).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF16348F),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                        ),
                        child: Text(
                          'Xác nhận',
                          style: GoogleFonts.interTight(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/svg/x.svg'),
                    onPressed: () {
                      Navigator.of(buildContext).pop();
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(anim1),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(anim1),
          child: child,
        ),
      );
    },
  );
}