import 'package:flutter/material.dart';
import 'package:phenikaaxdrive/features/profile/presentation/widgets/input_field.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


class InformationUpdateScreen extends StatelessWidget {
  const InformationUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, kTextTabBarHeight * 1.3, 0, 0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: 12),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    // Biểu tượng mũi tên quay lại
                    onPressed: () {
                      Navigator.pop(context); // Quay lại màn hình trước đó
                    },
                  ),
                ),

                Center(
                  child: Text(
                    'Cập nhật tài khoản',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.interTight(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: Color(0xFF0C215C),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 48),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  InfoInputFields(),

                  SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                contentPadding: const EdgeInsets.all(24),
                            backgroundColor: Colors.white,
                              content: SizedBox(
                                width: MediaQuery.of(context).size.width - 32,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/svg/circle_check.svg'),
                                    SizedBox(height: 16),
                                    Text(
                                      'Cập nhật tài khoản thành công!',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.interTight(
                                        color: Color(0xff0C215C),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        backgroundColor: Color(0xff0C215C),
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () {
                                        context.go('/');
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                        width: double.infinity,
                                          child:  Text(
                                            'Hoàn thành',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.interTight(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              height: 1.5,
                                            )
                                          )),
                                    ),

                                  ]
                                ),
                              )
                            );

                          }
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Color(0xff16348F),
                        foregroundColor: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        child: Text(
                          "Cập nhật",
                          style: GoogleFonts.interTight(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24,),

                  RichText(
                    text: TextSpan(
                      style:  GoogleFonts.interTight(
                        color: Color(0xff909AB1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.42857,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Bằng việc sử dụng'),
                        TextSpan(
                          text: ' PhenikaaXDrive',
                          style: GoogleFonts.interTight(color: Color(0xffEC6935)),
                        ),
                        TextSpan(
                          text: ', tôi đồng ý'
                        ),
                        TextSpan(
                          text: ' Thỏa thuận sử dụng PhenikaaXDrive ',
                          style: GoogleFonts.interTight(color: Color(0xff16348F)),
                        ),
                        TextSpan(text: 'và'),
                        TextSpan(
                          text: ' Chính sách bảo vệ quyền riêng tư',
                          style: GoogleFonts.interTight(color: Color(0xff16348F)),
                        ),


                      ],
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
