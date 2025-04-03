part of 'trip_bloc.dart';

abstract class TripState {}

class TripInitial extends TripState {}
class TripLoading extends TripState {}
class TripLoaded extends TripState {
  Map<String, dynamic> tripDetailsData;

  TripLoaded(this.tripDetailsData);
}
class TripError extends TripState {
  final String message;
  TripError({required this.message});
}