import 'package:flutter/material.dart';


class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  bool isExpanded = false; // Trạng thái mở rộng


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
                Column(
                  children: [
                    ExpansionTile(
                      trailing: Icon(
                        isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, // Đổi icon khi mở rộng
                        color: Color(0xFF0C215C),
                      ),
                      title: Text(
                        "Làm thế nào để đặt xe",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          fontSize: 16,
                          color: Color(0xFF0C215C), // Đổi màu chữ tiêu đề
                        ),
                      ),
                      collapsedBackgroundColor: null,
                      // Màu nền khi collapse
                      backgroundColor: null,
                      // Màu nền khi mở ra
                      tilePadding: EdgeInsets.only(bottom: 0),
                      // Khoảng cách giữa title và nội dung
                      childrenPadding: EdgeInsets.only(top: 0, bottom: 16),
                      // Giảm khoảng cách giữa title và nội dung
                      children: [
                        Text(
                          "Bạn có thể đặt xe bằng cách nhập điểm đón và điểm đến trên ứng dụng, chọn loại xe và xác nhận đặt xe.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: Color(0xFF909AB1),
                          ),
                        ),
                      ],
                      onExpansionChanged: (expanded) {
                        setState(() {
                          isExpanded = expanded; // Cập nhật trạng thái mở rộng
                        });
                      },
                    ),

                    ExpansionTile(
                      trailing: Icon(
                        isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, // Đổi icon khi mở rộng
                        color: Color(0xFF0C215C),
                      ),
                      title: Text(
                        "Làm thế nào để hủy chuyến đi?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          fontSize: 16,
                          color: Color(0xFF0C215C), // Đổi màu chữ tiêu đề
                        ),
                      ),
                      collapsedBackgroundColor: null,
                      // Màu nền khi collapse
                      backgroundColor: null,
                      // Màu nền khi mở ra
                      tilePadding: EdgeInsets.only(bottom: 0),
                      // Khoảng cách giữa title và nội dung
                      childrenPadding: EdgeInsets.only(top: 0, bottom: 16),
                      // Giảm khoảng cách giữa title và nội dung
                      children: [
                        Text(
                          "Bạn có thể hủy chuyến đi trong vòng 5 phút sau khi đặt xe.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: Color(0xFF909AB1),
                          ),
                        ),
                      ],
                      onExpansionChanged: (expanded) {
                        setState(() {
                          isExpanded = expanded; // Cập nhật trạng thái mở rộng
                        });
                      },
                    ),

                    ExpansionTile(
                      trailing: Icon(
                        isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, // Đổi icon khi mở rộng
                        color: Color(0xFF0C215C),
                      ),
                      title: Text(
                        "Làm thế nào để thanh toán?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          fontSize: 16,
                          color: Color(0xFF0C215C), // Đổi màu chữ tiêu đề
                        ),
                      ),
                      collapsedBackgroundColor: null,
                      // Màu nền khi collapse
                      backgroundColor: null,
                      // Màu nền khi mở ra
                      tilePadding: EdgeInsets.only(bottom: 0),
                      // Khoảng cách giữa title và nội dung
                      childrenPadding: EdgeInsets.only(top: 0, bottom: 16),
                      // Giảm khoảng cách giữa title và nội dung
                      children: [
                        Text(
                          "Content",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: Color(0xFF909AB1),
                          ),
                        ),
                      ],
                      onExpansionChanged: (expanded) {
                        setState(() {
                          isExpanded = expanded; // Cập nhật trạng thái mở rộng
                        });
                      },
                    ),

                    ExpansionTile(
                      trailing: Icon(
                        isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, // Đổi icon khi mở rộng
                        color: Color(0xFF0C215C),
                      ),
                      title: Text(
                        "Điều gì xảy ra nếu xe bị trễ?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          fontSize: 16,
                          color: Color(0xFF0C215C), // Đổi màu chữ tiêu đề
                        ),
                      ),
                      collapsedBackgroundColor: null,
                      // Màu nền khi collapse
                      backgroundColor: null,
                      // Màu nền khi mở ra
                      tilePadding: EdgeInsets.only(bottom: 0),
                      // Khoảng cách giữa title và nội dung
                      childrenPadding: EdgeInsets.only(top: 0, bottom: 16),
                      // Giảm khoảng cách giữa title và nội dung
                      children: [
                        Text(
                          "Content",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: Color(0xFF909AB1),
                          ),
                        ),
                      ],
                      onExpansionChanged: (expanded) {
                        setState(() {
                          isExpanded = expanded; // Cập nhật trạng thái mở rộng
                        });
                      },
                    ),

                    ExpansionTile(
                      trailing: Icon(
                        isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, // Đổi icon khi mở rộng
                        color: Color(0xFF0C215C),
                      ),
                      title: Text(
                        "Tôi có thể mang theo thú cưng không?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          fontSize: 16,
                          color: Color(0xFF0C215C), // Đổi màu chữ tiêu đề
                        ),
                      ),
                      collapsedBackgroundColor: null,
                      // Màu nền khi collapse
                      backgroundColor: null,
                      // Màu nền khi mở ra
                      tilePadding: EdgeInsets.only(bottom: 0),
                      // Khoảng cách giữa title và nội dung
                      childrenPadding: EdgeInsets.only(top: 0, bottom: 16),
                      // Giảm khoảng cách giữa title và nội dung
                      children: [
                        Text(
                          "Content",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: Color(0xFF909AB1),
                          ),
                        ),
                      ],
                      onExpansionChanged: (expanded) {
                        setState(() {
                          isExpanded = expanded; // Cập nhật trạng thái mở rộng
                        });
                      },
                    ),
                  ],
                ),
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
