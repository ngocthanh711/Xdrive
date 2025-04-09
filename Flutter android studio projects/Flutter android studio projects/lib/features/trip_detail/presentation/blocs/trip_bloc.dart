import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phenikaaxdrive/features/trip_detail/presentation/pages/trip_detail_screen.dart';

part 'trip_event.dart';

part 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  TripBloc() : super(TripInitial()) {
    on<LoadTrip>(_onLoadTrip);
  }

  Future<void> _onLoadTrip(LoadTrip event, Emitter<TripState> emit) async {
    emit(TripLoading());
    try {
      final tripDetailsData = await fetchMockTrips();
      emit(TripLoaded(tripDetailsData));
    } catch (e) {
      emit(TripError(message: "Lỗi tải dữ liệu"));
    }
  }
}
