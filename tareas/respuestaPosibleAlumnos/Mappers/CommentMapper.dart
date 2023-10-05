import '../Bulders/CommentBuilder.dart';
import '../Dtos/CommentDto.dart';
import '../Models/Comment.dart';

abstract class CommentMapper {
  CommentDto mapperComment(Comment comment) =>
      CommentBuilder().setName(comment.name)
      .setEmail(comment.email)
      .setBody(comment.body)
      .build();


List<CommentDto> mapperListComment(List<dynamic> arrayComments) {
  return arrayComments.map((elementPost) => CommentBuilder()
      .setName(elementPost.name)
      .setEmail(elementPost.email)
      .setBody(elementPost.body)
      .build()).toList();
}
}
