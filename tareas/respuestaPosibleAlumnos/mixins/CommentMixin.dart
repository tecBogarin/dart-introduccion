import '../Models/Comment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

mixin CommentMixin {
  Future<Comment> fetchComment(String urlString) async {
    final response = await http.get(Uri.parse(urlString));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Comment.fromJson(data);
    } else {
      throw Exception('Failed to load post');
    }
  }


  Future<List<Comment>> fetchAllComment(String urlString) async {
    final response = await http.get(Uri.parse(urlString));

    if (response.statusCode == 200) {
      final List<dynamic> resultSet = json.decode(response.body);

      // Usamos map para convertir cada elemento en resultSet a un objeto Post
      final List<Comment> results = resultSet.map((element) {
        final Map<String, dynamic> data = element;
        return Comment.fromJson(data);
      }).toList();

      return results;
    } else {
      throw Exception('Failed to load post');
    }
  }
}