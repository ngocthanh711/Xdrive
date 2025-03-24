import 'package:flutter/material.dart';
import 'package:phenikaaxdrive/components/questions.dart';




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
                image: AssetImage("assets/Background.png"),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Xin chào, chúng tôi có thể giúp gì cho bạn?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                                // Màu với độ trong suốt
                                blurRadius: 16,
                                // Độ mờ của bóng
                                spreadRadius: 0,
                                // Độ lan rộng
                                offset: Offset(0, 4), // Độ dịch chuyển (x, y)
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                "assets/logo_tro_chuyen.png",
                                width: 60,
                                height: 60,
                              ), // Ảnh icon
                              SizedBox(height: 8),
                              Text(
                                "Trò chuyện với",
                                style: TextStyle(
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
                                style: TextStyle(
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
                                // Màu với độ trong suốt
                                blurRadius: 16,
                                // Độ mờ của bóng
                                spreadRadius: 0,
                                // Độ lan rộng
                                offset: Offset(0, 4), // Độ dịch chuyển (x, y)
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                "assets/logo_goi_tong_dai.png",
                                width: 60,
                                height: 60,
                              ), // Ảnh icon
                              SizedBox(height: 8),
                              Text(
                                "Gọi tổng đài",
                                style: TextStyle(
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
                                style: TextStyle(
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
                  children: const [
                    Icon(
                      Icons.help_outline,
                      color: Color(0xFF0C215C),
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Câu hỏi thường gặp",
                      style: TextStyle(
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
          Positioned(
            top: kToolbarHeight,
            child: Text(
              "Hỗ trợ khách hàng",
              textAlign: TextAlign.center,
              style: TextStyle(
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
