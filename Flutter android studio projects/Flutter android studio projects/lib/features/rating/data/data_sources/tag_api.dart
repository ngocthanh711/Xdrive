import 'package:dio/dio.dart';

class TagApi {
  final Dio dio;

  TagApi({Dio? dio}) : dio = dio ?? Dio();

  Future<List<String>> fetchTags() async {
    try {
      final response = await dio.get('http://127.0.0.1:5000/feedback');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((tag) => tag.toString()).toList();
      } else {
        throw Exception('Failed to load tags');
      }
    } catch (e) {
      throw Exception('API Error: $e');
    }
  }
}
