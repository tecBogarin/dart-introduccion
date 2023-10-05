import '../Bulders/PostBuilder.dart';
import '../Dtos/PostDto.dart';
import '../Models/Post.dart';

abstract class PostMapper {
  PostDto mapperPost(Post data) =>
      PostDtoBuilder().setTitle(data.title).setBody(data.body).build();
      
List<PostDto> mapperListPost(List<dynamic> arrayPosts) {
  return arrayPosts.map((elementPost) => PostDtoBuilder()
      .setTitle(elementPost.title)
      .setBody(elementPost.body)
      .build()).toList();
}

}
