import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:phenikaaxdrive/features/history/presentation/widgets/format_number.dart';
import 'package:phenikaaxdrive/features/history/data/models/trip_model.dart';
import 'package:phenikaaxdrive/features/trip_detail/presentation/widgets/dash_line.dart';
import 'package:google_fonts/google_fonts.dart';

class TripCard extends StatelessWidget {
  final Trip trip;

  TripCard({required this.trip});

  Widget _getStatusButton(BuildContext context, String status) {
    Color buttonColor;
    String buttonText;
    Color buttonTextColor;

    switch (status) {
      case "Đang chạy":
        buttonColor = Color(0xffFEEAE6);
        buttonText = "Đang chạy";
        buttonTextColor = Color(0xffEC6935);
        break;
      case "Đã hủy":
        buttonColor = Color(0xffCAD1E4);
        buttonText = "Đã hủy";
        buttonTextColor = Color(0xff0C215C);
        break;
      case "Hoàn thành":
        buttonColor = Color(0xffE6FEE8);
        buttonText = "Hoàn thành";
        buttonTextColor = Color(0xff32A661);
        break;
      default:
        buttonColor = Colors.grey;
        buttonText = "Không xác định";
        buttonTextColor = Colors.white;
        break;
    }

    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        buttonText,
        style: GoogleFonts.interTight(
          fontSize: 12,
          height: 1.3333,
          fontWeight: FontWeight.w700,
          color: buttonTextColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffCAD1E4), width: 1),
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
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${trip.time} ${trip.date}",
                  style: GoogleFonts.interTight(
                    color: Color(0xff909AB1),
                    fontSize: 14,
                  ),
                ),

                _getStatusButton(context, trip.status),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Image.asset("assets/images/bus.png", width: 50),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff16348F),
                      ),
                    ),
                    CustomPaint(
                      size: Size(1, 29),
                      painter: DashedLinePainter(),
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffEC6935),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRect(
                        child: Container(
                          height: 23,
                          width: null,
                          child: Text(
                            trip.from,
                            style: GoogleFonts.interTight(
                              color: Color(0xff0C215C),
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      ClipRect(
                        child: Container(
                          height: 23,
                          width: null,
                          child: Text(
                            trip.to,
                            style: GoogleFonts.interTight(
                              color: Color(0xff0C215C),
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(height: 1, color: Color(0xffCAD1E4)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatPriceString('${trip.price}'),
                        style: GoogleFonts.interTight(
                          color: Color(0xff0C215C),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.4,
                        ),
                      ),
                      if (trip.oldPrice > trip.price)
                        Text(
                          formatPriceString('${trip.oldPrice}'),
                          style: GoogleFonts.interTight(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Color(0xff909AB1),
                            color: Color(0xff909AB1),
                            fontWeight: FontWeight.w500,
                            height: 1.3333,
                          ),
                        ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildButton(
                      context,
                      "Chi tiết",
                      Color(0xffDAE4FF),
                      Color(0xff16348F),
                    ),
                    if (trip.status == "Đã hủy" || trip.status == "Hoàn thành")
                      _buildButton2(
                        context,
                        "Đặt lại",
                        Color(0xff16348F),
                        Color(0xffFFFFFF),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton2(
    BuildContext context,
    String label,
    Color color,
    Color textcolor,
  ) {
    return Container(
      padding: EdgeInsets.only(left: 8),
      child: ElevatedButton(
        onPressed: () {
          context.push('/');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: Text(
          label,
          style: GoogleFonts.interTight(
            color: textcolor,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            height: 1.3333,
          ),
        ),
      ),
    );
  }
}

Widget _buildButton(
  BuildContext context,
  String label,
  Color color,
  Color textcolor,
) {
  return Container(
    padding: EdgeInsets.only(left: 8),
    child: ElevatedButton(
      onPressed: () {
        context.push('/tripDetail'); // Thêm vào stack
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
      child: Text(
        label,
        style: GoogleFonts.interTight(
          color: textcolor,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          height: 1.3333,
        ),
      ),
    ),
  );
}
