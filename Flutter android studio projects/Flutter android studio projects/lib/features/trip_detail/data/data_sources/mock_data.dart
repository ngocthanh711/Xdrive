import 'package:phenikaaxdrive/features/trip_detail/data/models/trip_detail_model.dart';

Map<String, dynamic> tripDetailsData = {
  "trip_details": {
    "booking_id": "12342346",
    "date": "01/01/2025",
    "time": "15:00",
    "vehicle": {
      "license_plate": "335213X",
      "color": "Màu trắng",
      "image_url": "assets/images/bus_detail.png"
    },
    "distance": "1 km",
    "waiting_time": "4 phút",
    "travel_time": "5 phút"
  },
  "locations": [
    {
      "name": "Trường Đại học Phenikaa",
      "address": "P. Nguyễn Trác, Yên Nghĩa, Hà Đông, Hà Nội",
    },
    {
      "name": "Trường Đại học Phenikaa",
      "address": "P. Nguyễn Trác, Yên Nghĩa, Hà Đông, Hà Nội",
    }
  ],
  "payment": {
    "methodIcon": "assets/images/vietcombank.png",
    "method": "Vietcombank",
    "amount": 20000
  }
};

Map<String, dynamic> startLocation = tripDetailsData['locations'][0];
Map<String, dynamic> endLocation = tripDetailsData['locations'][1];

String startLocationName = startLocation['name'];
String startLocationAddress = startLocation['address'];

String endLocationName = endLocation['name'];
String endLocationAddress = endLocation['address'];