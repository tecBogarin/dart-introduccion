import 'dart:convert';
import 'package:http/http.dart' as http;

// ejemplo de modelo
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

// ejemplo Dto
class PostDto {
  final String _title;
  final String _body;

  PostDto(this._title, this._body);

  String get getTitle => _title;
  String get getBody => _body;
}

//constuir el elemento
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

//puede ser mixin
PostDto mapperPost(Post data) =>
    PostDtoBuilder().setTitle(data.title).setBody(data.body).build();

// puede ser mixin o clase propia con mas funcionalidades
Future<Post> fetchPost(String urlString) async {
  final response = await http.get(Uri.parse(urlString));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return Post.fromJson(data);
  } else {
    throw Exception('Failed to load post');
  }
}

// mixin, helper o una clases de conexión
Future<T> procesarRequest<T, P>(
    Future<T> Function(P) llamadoRequest, P url) async {
  try {
    final resultado = await Future.delayed(
        const Duration(seconds: 1), () => llamadoRequest(url));
    return resultado;
  } catch (e) {
    throw e; // Puedes manejar errores aquí según tus necesidades
  }
}

void uriEntender(String urlString) {
  // Utilizar Uri.parse para analizar la cadena en un objeto Uri
  Uri uri = Uri.parse(urlString);

  // Acceder a los componentes de la URI
  print("Esquema: ${uri.scheme}"); // Output: Esquema: https
  print("Host: ${uri.host}"); // Output: Host: www.ejemplo.com
  print("Puerto: ${uri.port}"); // Output: Puerto: 8080
  print("Ruta o endpoint: ${uri.path}"); // Output: Ruta: /ruta
  print(
      "Parámetros de consulta: ${uri.queryParameters}"); // Output: Parámetros de consulta: {parametro: valor}
}

void main() async {
  const url = 'https://jsonplaceholder.typicode.com/posts/1';
  const url2 = 'https://jsonplaceholder.typicode.com/posts/2';
  const urlAllPost='https://jsonplaceholder.typicode.com/posts';
/*
  try {
    final post = await fetchPost(url2);
    print('Post Title: ${post.titulo}');
    print('--------------------------');
    print('Post Body: ${post.cuerpo}');
  } catch (e) {
    print('Error: $e');
  }

  print('--------------------------------');

  try {
    final post =
        await Future.delayed(const Duration(seconds: 1), () => fetchPost(url));
    print('Post Title: ${post.title}');
    print('--------------------------');
    print('Post Body: ${post.body}');
  } catch (e) {
    print('Error: $e');
  }
  print('--------------------------------');
  */

  print('--------------------------------');

  try {
    final post = mapperPost(await procesarRequest(fetchPost, url));
    print('Post Title: ${post.getTitle}');
    print('--------------------------');
    print('Post Body: ${post.getBody}');
  } catch (e) {
    print('Error: $e');
  }
  print('--------------------------------');
  
  /*
  try {
    final post = mapperPost(await procesarRequest(fetchPost, urlAllPost));
    print('Post Title: ${post.getTitle}');
    print('--------------------------');
   print('Post Body: ${post.getBody}');
  } catch (e) {
    print('Error: $e');
  }
  print('--------------------------------');
*/
  uriEntender(url);
}