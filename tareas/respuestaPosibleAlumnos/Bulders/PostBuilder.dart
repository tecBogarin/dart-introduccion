import '../Dtos/PostDto.dart';

class PostDtoBuilder {
  late String _title;
  late String _body;

  PostDtoBuilder setTitle(String title) {
    _title = title;
    return this;
  }

  PostDtoBuilder setBody(String body) {
    _body = body;
    return this;
  }

  PostDto build() {
    return PostDto(_title, _body);
  }
}
