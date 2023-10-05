import '../Dtos/CommentDto.dart';

class CommentBuilder {
  late String _name;
  late String _email;
  late String _body;

  CommentBuilder setName(String name) {
    _name = name;
    return this;
  }

  CommentBuilder setEmail(String email) {
    _email = email;
    return this;
  }

  CommentBuilder setBody(String body) {
    _body = body;
    return this;
  }

  CommentDto build() => CommentDto(_name, _email, _body);
}
