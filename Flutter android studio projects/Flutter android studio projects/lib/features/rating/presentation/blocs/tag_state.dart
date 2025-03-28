import 'package:equatable/equatable.dart';

class TagState extends Equatable {
  final List<String> tags;
  final Set<String> selectedTags;
  final bool isLoading;
  final String? errorMessage;

  const TagState({
    required this.tags,
    required this.selectedTags,
    this.isLoading = false,
    this.errorMessage,
  });

  @override
  List<Object> get props => [tags, selectedTags, isLoading, errorMessage ?? ''];
}
