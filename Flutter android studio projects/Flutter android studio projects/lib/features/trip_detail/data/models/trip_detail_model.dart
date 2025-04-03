class Vehicle {
  final String licensePlate;
  final String color;
  final String imageUrl;

  Vehicle({required this.licensePlate, required this.color, required this.imageUrl});
}

class Location {
  final String name;
  final String address;

  Location({required this.name, required this.address});
}

class Payment {
  final String methodIcon;
  final String method;
  final int amount;

  Payment({required this.methodIcon, required this.method, required this.amount });
}

class TripDetails {
  final String bookingId;
  final String date;
  final String time;
  final Vehicle vehicle;
  final String distance;
  final String waitingTime;
  final String travelTime;
  final List<Location> locations;
  final Payment payment;

  TripDetails({
    required this.bookingId,
    required this.date,
    required this.time,
    required this.vehicle,
    required this.distance,
    required this.waitingTime,
    required this.travelTime,
    required this.locations,
    required this.payment,
  });
}