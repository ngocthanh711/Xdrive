
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phenikaaxdrive/features/history/data/models/trip_model.dart';
import 'package:phenikaaxdrive/features/history/presentation/pages/history_screen.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    on<HistoryLoadRequested>(_onHistoryLoadRequested);
  }

  Future<void> _onHistoryLoadRequested(
      HistoryLoadRequested event, Emitter<HistoryState> emit) async {
    emit(HistoryLoadInProgress());
    try {
      final tripsByMonth = await fetchMockTrips();
      emit(HistoryLoadSuccess(tripsByMonth));
    } catch (e) {
      emit(HistoryLoadFailure('Lỗi tải dữ liệu'));
    }
  }
}