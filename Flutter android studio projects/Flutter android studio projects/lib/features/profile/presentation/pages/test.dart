import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tess extends StatelessWidget {
  const Tess({super.key});



  void showCustomDialogWithMargin(BuildContext context) {
    showGeneralDialog(
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
                      SvgPicture.asset('assets/svg/circle_check.svg'),
                      const SizedBox(height: 16),
                      Text(
                        'Cập nhật ngôn ngữ thành công!',
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
                            'Hoàn thành',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
            centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showCustomDialogWithMargin(context);
            },
            child: Text('okkk'))
      ),
    );
  }
}
