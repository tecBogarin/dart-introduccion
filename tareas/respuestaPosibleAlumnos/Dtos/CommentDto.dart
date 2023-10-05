class CommentDto {
  final String _name;
  final String _email;
  final String _body;

  CommentDto(this._name, this._email, this._body);

  String get getName => _name;
  String get getEmail => _email;
  String get getBody => _body;
}
