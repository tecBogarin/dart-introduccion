class PostDto {
  final String _title;
  final String _body;

  PostDto(this._title, this._body);

  String get getTitle => _title;
  String get getBody => _body;
}