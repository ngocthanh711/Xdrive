import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phenikaaxdrive/features/rating/presentation/blocs/tag_bloc.dart';
import 'package:phenikaaxdrive/features/rating/presentation/blocs/tag_event.dart';
import 'package:phenikaaxdrive/features/rating/presentation/blocs/tag_state.dart';
import 'package:phenikaaxdrive/features/rating/data/data_sources/tag_api.dart';
import 'package:phenikaaxdrive/features/rating/data/repositories/tag_repository.dart';

class TagButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      TagBloc(tagRepository: TagRepository(tagApi: TagApi()))..add(FetchTagsEvent()),
      child: BlocBuilder<TagBloc, TagState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(child: Text('Lỗi: ${state.errorMessage}'));
          }

          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: state.tags.map((tag) {
                final isSelected = state.selectedTags.contains(tag);

                return ElevatedButton(
                  onPressed: () {
                    context.read<TagBloc>().add(ToggleTagEvent(tag));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? const Color(0xFF16348F) : const Color(0xFFDAE4FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 1.33333,
                      color: isSelected ? Colors.white : const Color(0xFF16348F),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}