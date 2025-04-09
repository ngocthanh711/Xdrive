import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';

class PrivateSetting extends StatefulWidget {
  const PrivateSetting({super.key});

  @override
  State<PrivateSetting> createState() => _PrivateSettingState();
}

class _PrivateSettingState extends State<PrivateSetting> {
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
                    'Tùy chỉnh riêng tư',
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Cho phép ứng dụng truy cập vị trí của bạn.',
                      style: GoogleFonts.interTight(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        height: 1.55556,
                        color: Color(0xFF0C215C),
                      ),
                    ),
                  ),


                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Luôn luôn',
                          style: GoogleFonts.interTight(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: Color(0xFF909AB1),
                          ),
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
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chỉ khi dùng ứng dụng',
                          style: GoogleFonts.interTight(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: Color(0xFF909AB1),
                          ),
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
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Không cho phép',
                          style: GoogleFonts.interTight(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: Color(0xFF909AB1),
                          ),
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
