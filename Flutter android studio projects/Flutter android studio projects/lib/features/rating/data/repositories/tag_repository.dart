import 'package:phenikaaxdrive/features/rating/data/data_sources/tag_api.dart';

class TagRepository {
  final TagApi tagApi;

  TagRepository({required this.tagApi});

  Future<List<String>> getTags() async {
    return await tagApi.fetchTags();
  }
}
