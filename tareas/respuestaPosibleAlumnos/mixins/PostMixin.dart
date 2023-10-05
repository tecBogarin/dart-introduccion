import '../Models/Post.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

mixin PostMixin {
  Future<Post> fetchPost(String urlString) async {
    final response = await http.get(Uri.parse(urlString));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Post.fromJson(data);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Post> fetchPostV2(
      Future<Map<String, dynamic>> Function(String) llamadoRequest,
      String urlString) async {
    try {
      return Post.fromJson(await llamadoRequest(urlString));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Post>> fetchAllPost(String urlString) async {
    final response = await http.get(Uri.parse(urlString));

    if (response.statusCode == 200) {
      final List<dynamic> resultSet = json.decode(response.body);

      // Usamos map para convertir cada elemento en resultSet a un objeto Post
      final List<Post> results = resultSet.map((element) {
        final Map<String, dynamic> data = element;
        return Post.fromJson(data);
      }).toList();

      return results;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
