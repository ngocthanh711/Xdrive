import 'package:flutter/material.dart';
import 'package:phenikaaxdrive/features/profile/presentation/widgets/payment_items.dart';
import 'package:google_fonts/google_fonts.dart';


class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
            SizedBox(height: 26),

            Container(
              padding: EdgeInsets.fromLTRB(13, 0, 19, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Ví điện tử',
                        style: GoogleFonts.interTight(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          height: 1.55556,
                          color: Color(0xFF0C215C),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                      PaymentItem(
                        pngIcon: 'assets/images/zaloPay.png',
                        title: "Zalo Pay",
                        path: '',
                      ),
                      SizedBox(height: 10),
                      PaymentItem(
                        pngIcon: 'assets/images/momo.png',
                        title: "Momo",
                        path: '',
                      ),

                      SizedBox(height: 32),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Ngân hàng',
                            style: GoogleFonts.interTight(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              height: 1.55556,
                              color: Color(0xFF0C215C),
                            ),
                          ),
                        ],
                      ),

                      PaymentItem(
                        pngIcon: 'assets/images/vietcombank.png',
                        title: "Vietcombank",
                        path: '',
                      ),
                      SizedBox(height: 8),
                      PaymentItem(
                        pngIcon: 'assets/images/vietinbank.png',
                        title: "Vietinbank",
                        path: '',
                      ),
                      SizedBox(height: 8),
                      PaymentItem(
                        pngIcon: 'assets/images/agribank.png',
                        title: "Agribank",
                        path: '',
                      ),
                      SizedBox(height: 8),
                      PaymentItem(
                        pngIcon: 'assets/images/bidv.png',
                        title: "BIDV",
                        path: '',
                      ),
                    ],
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
