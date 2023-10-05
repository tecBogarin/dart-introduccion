import '../Dtos/PostDto.dart';
import '../Mappers/PostMapper.dart';
import '../DataSoruce.dart';
import '../mixins/PostMixin.dart';

class PostController extends PostMapper with PostMixin{
  final endpoints = '$HOST/posts';

  Future<PostDto> findPostById(int id) async {
    final url = '$endpoints/$id';
    try {
      final post = super.mapperPost(await Future.delayed(
          const Duration(seconds: 1), () => fetchPost(url)));
      return post;
    } catch (e) {
      throw Exception('Failed to find post: $e');
    }
  }

  Future<List<dynamic>> allPost() async {
    final url = '$endpoints/';
    try {
      final post = super.mapperListPost(await Future.delayed(
          const Duration(seconds: 1), () => fetchAllPost(url)));
      return post;
    } catch (e) {
      throw Exception('Failed to find post: $e');
    }
  }
}
