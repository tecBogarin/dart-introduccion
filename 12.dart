void main() {
  print('iniciando programa');
  httGet('wiii').then((value) => print(value));
  httGet2('wiii')
      .then((value) => print(value))
      .catchError((error) => print(error));
  print('terminando programa');
}

Future<String> httGet(String url) =>
    Future.delayed(Duration(seconds: 1), () => 'respuesta de la petición http');

Future<String> httGet2(String url) => Future.delayed(
    Duration(seconds: 1), () => throw 'Error no funciona');
