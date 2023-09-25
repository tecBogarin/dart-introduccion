void main() async {
  print('inicia el programa');
  try {
    final value = await httGet2('uno/dos/');
  } on Exception catch (e) {
    print('Excepción controlada: $e');
  } catch (e) {
    print('error sin control de la excepción $e');
  } finally {
    print('entre en el on o en el catch  pasara por aquí también');
  }
}

Future<String> httGet2(String url) async => await Future.delayed(
    Duration(seconds: 1), () => throw Exception('Error no funciona'));
