import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() => _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool status = false;
  bool status2 = false;
  bool status3 = false;

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
                    'Cấu hình thông báo',
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
            SizedBox(height: 33),

            Padding(
              padding: const EdgeInsets.fromLTRB(13, 0, 12, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Thông báo chung',
                              style: GoogleFonts.interTight(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                                color: Color(0xFF0C215C),
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              width: 266,
                              child: Text(
                                'Nhận thông báo về các chương trình khuyến mãi, tin tức và cập nhật quan trọng. ',
                                style: GoogleFonts.interTight(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3333333,
                                  color: Color(0xFF909AB1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        FlutterSwitch(
                          width: 51,
                          height: 31,
                          toggleSize: 30.0,
                          value: status,
                          borderRadius: 30.0,
                          padding: 2.0,
                          activeColor: Color(0xFF16348F),
                          inactiveColor: Color(0xFF909AB1),
                          showOnOff: false,
                          onToggle: (val) {
                            setState(() {
                              status = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Thông báo chuyến đi',
                              style: GoogleFonts.interTight(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                                color: Color(0xFF0C215C),
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              width: 266,
                              child: Text(
                                'Nhận thông báo về trạng thái chuyến đi, thông tin xe và tài xế.',
                                style: GoogleFonts.interTight(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3333333,
                                  color: Color(0xFF909AB1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        FlutterSwitch(
                          width: 51,
                          height: 31,
                          toggleSize: 30.0,
                          value: status2,
                          borderRadius: 30.0,
                          padding: 2.0,
                          activeColor: Color(0xFF16348F),
                          inactiveColor: Color(0xFF909AB1),
                          showOnOff: false,
                          onToggle: (val) {
                            setState(() {
                              status2 = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Thông báo thanh toán',
                              style: GoogleFonts.interTight(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                                color: Color(0xFF0C215C),
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              width: 266,
                              child: Text(
                                'Nhận thông báo về các giao dịch thanh toán, khuyến mãi và các vấn đề liên quan đến tài khoản.',
                                style: GoogleFonts.interTight(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 1.3333333,
                                  color: Color(0xFF909AB1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        FlutterSwitch(
                          width: 51,
                          height: 31,
                          toggleSize: 30.0,
                          value: status3,
                          borderRadius: 30.0,
                          padding: 2.0,
                          activeColor: Color(0xFF16348F),
                          inactiveColor: Color(0xFF909AB1),
                          showOnOff: false,
                          onToggle: (val) {
                            setState(() {
                              status3 = val;
                            });
                          },
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
