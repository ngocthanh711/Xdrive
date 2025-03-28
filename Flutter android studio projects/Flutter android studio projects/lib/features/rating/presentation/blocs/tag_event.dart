import 'package:equatable/equatable.dart';

abstract class TagEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchTagsEvent extends TagEvent {}

class ToggleTagEvent extends TagEvent {
  final String tag;

  ToggleTagEvent(this.tag);

  @override
  List<Object> get props => [tag];
}
