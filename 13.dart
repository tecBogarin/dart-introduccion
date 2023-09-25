void main() async {
  print('iniciando programa');
  final value = await httGet('wiii');
  print(value);
 
  print('terminando programa');
  try {
     final value2 = await httGet2('wiii');
  } catch (e) {
    print(e);
  }
}

Future<String> httGet(String url) async => await Future.delayed(
    Duration(seconds: 1), () => 'respuesta de la petición http');

Future<String> httGet2(String url) async =>
    await Future.delayed(Duration(seconds: 1), () => throw 'Error no funciona');
