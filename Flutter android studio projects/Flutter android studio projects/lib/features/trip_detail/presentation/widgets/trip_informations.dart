import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phenikaaxdrive/features/trip_detail/presentation/pages/trip_detail_screen.dart';
import 'package:phenikaaxdrive/features/trip_detail/data/models/trip_detail_model.dart';
import 'package:phenikaaxdrive/features/trip_detail/data/data_sources/mock_data.dart';
import 'package:phenikaaxdrive/features/trip_detail/presentation/widgets/dash_line.dart';
import 'package:phenikaaxdrive/features/history/presentation/widgets/format_number.dart';
import 'package:google_fonts/google_fonts.dart';


class TripInformations extends StatelessWidget {
  final Map<String, dynamic> tripDetailsData;

  TripInformations({required this.tripDetailsData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children:  [
            Row(
              children: [
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mã đặt chuyến: ${tripDetailsData['trip_details']['booking_id']}',
                      style: GoogleFonts.interTight(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        height: 1.55556,
                        color: Color(0xff0C215C),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/time.svg',
                        ),
                        SizedBox(width: 8),
                        Text(
                          '${tripDetailsData['trip_details']['date']} | ${tripDetailsData['trip_details']['time']}',
                          style: GoogleFonts.interTight(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.42857,
                            color: Color(0xff0C215C),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xffCAD1E4),
                          width: 1,
                        ),
                        borderRadius:
                        BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Row(
                        children: [
                          Text(
                            '${tripDetailsData['trip_details']['vehicle']['license_plate']}',
                            style: GoogleFonts.interTight(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.42857,
                              color: Color(0xff0C215C),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 1,
                            height: 20,
                            color: Color(0xffCAD1E4),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '${tripDetailsData['trip_details']['vehicle']['color']}',
                            style: GoogleFonts.interTight(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.42857,
                              color: Color(0xffEC6935),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 11),
                Expanded(
                  child: Image.asset(
                    "${tripDetailsData['trip_details']['vehicle']['image_url']}",
                    height: 134,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: Color(0xffF0F4FF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          '${tripDetailsData['trip_details']['distance']}',
                          style: GoogleFonts.interTight(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: Color(0xff0C215C),
                          ),
                        ),
                        Text(
                          'Quãng đường',
                          style: GoogleFonts.interTight(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.42857,
                            color: Color(0xff909AB1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          '${tripDetailsData['trip_details']['waiting_time']}',
                          style: GoogleFonts.interTight(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: Color(0xff0C215C),
                          ),
                        ),
                        Text(
                          'Thời gian chờ',
                          style: GoogleFonts.interTight(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.42857,
                            color: Color(0xff909AB1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          '${tripDetailsData['trip_details']['travel_time']}',
                          style: GoogleFonts.interTight(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: Color(0xff0C215C),
                          ),
                        ),
                        Text(
                          'Thời gian đi',
                          style: GoogleFonts.interTight(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.42857,
                            color: Color(0xff909AB1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Color(0xffCAD1E4),
                    width: 1.0,
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/bluedot.svg',
                      ),
                      CustomPaint(
                        size: Size(1, 55),
                        painter: DashedLinePainter(),
                      ),
                      SvgPicture.asset(
                        'assets/svg/orangedot.svg',
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              'assets/svg/wait_icon.svg',
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${startLocationName}',
                                style: GoogleFonts.interTight(
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.w600,
                                  height: 1.5,
                                  color: Color(
                                    0xff0C215C,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${startLocationAddress}',
                                style: GoogleFonts.interTight(
                                  fontSize: 14,
                                  fontWeight:
                                  FontWeight.w500,
                                  height: 1.42857,
                                  color: Color(
                                    0xff909AB1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              'assets/svg/orangelocation.svg',
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${endLocationName}',
                                style: GoogleFonts.interTight(
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight.w600,
                                  height: 1.5,
                                  color: Color(
                                    0xff0C215C,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${endLocationAddress}',
                                style: GoogleFonts.interTight(
                                  fontSize: 14,
                                  fontWeight:
                                  FontWeight.w500,
                                  height: 1.42857,
                                  color: Color(
                                    0xff909AB1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            Align(
              alignment: Alignment.centerLeft,
              // Căn text ra ngoài cùng bên trái
              child: Text(
                'Thanh toán',
                style: GoogleFonts.interTight(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                  color: Color(0xff0C215C),
                ),
              ),
            ),

            SizedBox(height: 16),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      '${tripDetailsData['payment']['methodIcon']}',
                    ),
                    SizedBox(width: 16),
                    Text(
                      '${tripDetailsData['payment']['method']}',
                      style: GoogleFonts.interTight(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Color(0xff0C215C),
                      ),
                    ),
                  ],
                ),
                Text(
                  formatPriceString('${tripDetailsData['payment']['amount']}'),
                  style: GoogleFonts.interTight(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 1.4,
                    color: Color(0xff0C215C),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}