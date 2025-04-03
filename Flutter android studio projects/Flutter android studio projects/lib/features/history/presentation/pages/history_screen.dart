import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phenikaaxdrive/features/history/data/models/trip_model.dart';
import 'package:phenikaaxdrive/features/history/data/data_sources/mock_data.dart';
import 'package:phenikaaxdrive/features/history/presentation/widgets/trip_card.dart';
import 'package:phenikaaxdrive/features/history/presentation/blocs/history_bloc.dart';



class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc()..add(HistoryLoadRequested()),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(
                0,
                kTextTabBarHeight * 1.3,
                0,
                16,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/Background.png"),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Lịch sử chuyến đi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: Color(0xFF0C215C),
                    ),
                  ),

                  SizedBox(height: 31),

                  Expanded(
                    // Added Expanded here
                    child: FutureBuilder<Map<String, List<Trip>>>(
                      future: fetchMockTrips(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text("Lỗi tải dữ liệu"));
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Center(
                            child: Text("Không có dữ liệu chuyến đi"),
                          );
                        }

                        final tripsByMonth = snapshot.data!;
                        return ListView(
                          padding: EdgeInsets.all(16),
                          children:
                              tripsByMonth.entries.map((entry) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      entry.key,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        height: 1.42857,
                                        color: Color(0xff0C215C),
                                      ),
                                    ),
                                    SizedBox(height: 3.5),
                                    Column(
                                      children:
                                          entry.value
                                              .map((trip) => TripCard(trip: trip))
                                              .toList(),
                                    ),
                                    SizedBox(height: 23.5),
                                  ],
                                );
                              }).toList(),
                        );
                      },
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



Future<Map<String, List<Trip>>> fetchMockTrips() async {
  await Future.delayed(Duration(seconds: 0));
  return tripsByMonth;
}
