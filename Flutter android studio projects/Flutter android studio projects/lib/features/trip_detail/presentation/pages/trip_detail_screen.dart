import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phenikaaxdrive/features/trip_detail/data/data_sources/mock_data.dart';
import 'package:phenikaaxdrive/features/trip_detail/presentation/blocs/trip_bloc.dart';
import 'package:phenikaaxdrive/features/trip_detail/presentation/widgets/trip_informations.dart';
import 'package:google_fonts/google_fonts.dart';

class TripDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripBloc()..add(LoadTrip()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, kTextTabBarHeight * 1.3, 0, 0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
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
                      'Chi tiết chuyến đi',
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

              SizedBox(height: 21),

              FutureBuilder<Map<String, dynamic>>(
                future: fetchMockTrips(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Lỗi tải dữ liệu"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("Không có dữ liệu chuyến đi"));
                  }

                  final tripDetailsData = snapshot.data!;
                  return TripInformations(tripDetailsData: tripDetailsData);
                },
              ),

              SizedBox(height: 21),



              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                        color: Color(0xffCAD1E4),
                        width: 1,
                      ), // Chỉ có border top
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Color(0xffDAE4FF),
                            foregroundColor: Color(0xff16348F),
                          ),
                          child: Text(
                            "Đặt về",
                            style: GoogleFonts.interTight(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            context.push('/');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Color(0xff16348F),
                            foregroundColor: Colors.white,
                          ),
                          child: Text(
                            "Đặt lại",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> fetchMockTrips() async {
  await Future.delayed(Duration(seconds: 1));
  return tripDetailsData;
}
