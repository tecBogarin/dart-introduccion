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
```dart
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
```

>La entrega de la tarea sera:
>
>> 1. hacer un documento técnico explicando  por que escogieron esa arquitectura, sus capas y lo que se configuro en ellas.
>>
>>> 1. Los pormenores al ejecutar e instalar dart
>>
>>> 2. la explicación de la funcionalidad **procesarRequest**.
>>
>>> 3. en que capa quedo el archivo de la configuración, como solucionaron el poderlo usar y por que se utilizo de esa forma.
>>
>>> 4. la explicación de uso de **factory**
>>
>>> 5. el documento tiene que tener portada indice introducción de una breve explicación de lo que lleva el documento y conclusion.
>>
>> 2. La URL del código funcionando con la arquitectura solicitada y ejecutando los ejemplos.
>>
>>> 1. tiene que tener claridad y contexto el nombre de las variables,funciones y clases.
>>
>>> 2. utilizar lo visto en clase e investigas patrones de diseños a utilizar.
>>
>>> 3. Reutilizar el código ya establecido  y no tener duplicidad de el.
>>
>________________________________________________________________