import 'package:flutter/material.dart';
import 'package:phenikaaxdrive/features/customer_support/presentation/widgets/questions.dart';
import 'package:google_fonts/google_fonts.dart';



class Support extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(
              16.0,
              kTextTabBarHeight * 2.8,
              16,
              8,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/Background.png"),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Xin chào, chúng tôi có thể giúp gì cho bạn?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.interTight(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: Color(0xFF0C215C),
                    ),
                  ),
                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Căn đều 2 ô
                    children: [
                      // Ô Trò chuyện
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(137, 153, 203, 0.24),
                                  offset: Offset(0, 4),
                                  blurRadius: 16,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  "assets/images/logo_tro_chuyen.png",
                                  width: 60,
                                  height: 60,
                                ), // Ảnh icon
                                SizedBox(height: 8),
                                Text(
                                  "Trò chuyện với",
                                  style: GoogleFonts.interTight(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.4,
                                    color: Color(0xFF0C215C),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "PhenikaaXDrive",
                                  style: GoogleFonts.interTight(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.4,
                                    color: Color(0xFFEC6935),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 16),

                      // Ô Gọi tổng đài
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(137, 153, 203, 0.24),
                                  offset: Offset(0, 4),
                                  blurRadius: 16,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  "assets/images/logo_goi_tong_dai.png",
                                  width: 60,
                                  height: 60,
                                ), // Ảnh icon
                                SizedBox(height: 8),
                                Text(
                                  "Gọi tổng đài",
                                  style: GoogleFonts.interTight(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.4,
                                    color: Color(0xFF0C215C),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "PhenikaaXDrive",
                                  style: GoogleFonts.interTight(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.4,
                                    color: Color(0xFFEC6935),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 39),
                  Row(
                    children: [
                      Icon(
                        Icons.help_outline,
                        color: Color(0xFF0C215C),
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Câu hỏi thường gặp",
                        style: GoogleFonts.interTight(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                          color: Color(0xFF0C215C),
                        ),
                      ),
                    ],
                  ),

                  FAQScreen(),



                ],
              ),

            ),
          ),
          Positioned(
            top: kToolbarHeight,
            child: Text(
              "Hỗ trợ khách hàng",
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
    );
  }
}
