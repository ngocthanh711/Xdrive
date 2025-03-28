import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phenikaaxdrive/features/rating/data/repositories/tag_repository.dart';
import 'tag_event.dart';
import 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  final TagRepository tagRepository;

  TagBloc({required this.tagRepository})
      : super(const TagState(tags: [], selectedTags: {})) {
    on<FetchTagsEvent>(_onFetchTags);
    on<ToggleTagEvent>(_onToggleTag);
  }

  void _onFetchTags(FetchTagsEvent event, Emitter<TagState> emit) async {
    emit(TagState(tags: [], selectedTags: state.selectedTags, isLoading: true));

    try {
      final tags = await tagRepository.getTags();
      emit(TagState(tags: tags, selectedTags: state.selectedTags));
    } catch (error) {
      emit(TagState(tags: [], selectedTags: state.selectedTags, errorMessage: error.toString()));
    }
  }

  void _onToggleTag(ToggleTagEvent event, Emitter<TagState> emit) {
    final newTags = Set<String>.from(state.selectedTags);
    if (newTags.contains(event.tag)) {
      newTags.remove(event.tag);
    } else {
      newTags.add(event.tag);
    }
    emit(TagState(tags: state.tags, selectedTags: newTags));
  }
}
