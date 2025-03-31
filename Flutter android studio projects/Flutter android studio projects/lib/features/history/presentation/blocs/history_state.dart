
part of 'history_bloc.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoadInProgress extends HistoryState {}

class HistoryLoadSuccess extends HistoryState {
  final Map<String, List<Trip>> tripsByMonth;

  HistoryLoadSuccess(this.tripsByMonth);
}

class HistoryLoadFailure extends HistoryState {
  final String errorMessage;

  HistoryLoadFailure(this.errorMessage);
}