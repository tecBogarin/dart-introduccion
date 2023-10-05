import '../Dtos/CommentDto.dart';
import '../Mappers/CommentMapper.dart';
import '../DataSoruce.dart';
import '../mixins/CommentMixin.dart';

class CommentController extends CommentMapper with CommentMixin{
  final endpoints = '$HOST/comments';

  Future<CommentDto> findCommentById(int id) async {
    final url = '$endpoints/$id';
    try {
      final post = super.mapperComment(await Future.delayed(
          const Duration(seconds: 1), () => fetchComment(url)));
      return post;
    } catch (e) {
      throw Exception('Failed to find post: $e');
    }
  }

  Future<List<dynamic>> allComments() async {
    final url = '$endpoints/';
    try {
      final post = super.mapperListComment(await Future.delayed(
          const Duration(seconds: 1), () => fetchAllComment(url)));
      return post;
    } catch (e) {
      throw Exception('Failed to find post: $e');
    }
  }
}
