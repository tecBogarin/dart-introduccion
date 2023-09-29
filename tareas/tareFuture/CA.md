# Criterios de aceptación

1. Escoge una arquitectura ya sea MVC, MVVM, MVP o Clean Arquitectura y estructura el código.
2. investigar solo la instalación de dart https://dart.dev/get-dart y usarlo para usar pub get
3. Investiga como funciona el método. **procesarRequest** para explicarlo en un archivo.
4. crea un archivo de configuración el cual tengas como una variable estática el **Host** cuando quieras usara un **endpoint** se indica el Host concatenando el endpoint.
 ejemplo.
``` dart
final host='localhost.com';
print('$host/mundo');
 ```   
5. Conforme a la arquitectura as funcionar la captura de todo los datos e imprimemos desde un DTO.
 ``` dart
 try {
    final post = mapperPost(await procesarRequest(fetchPost, urlAllPost));
    print('Post Title: ${post.getTitle}');
    print('--------------------------');
   print('Post Body: ${post.getBody}');
  } catch (e) {
    print('Error: $e');
  }
```
6. explicar ese fragmento de código y especialmente  texto que dice **factory**  
```` dart
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
    ```
