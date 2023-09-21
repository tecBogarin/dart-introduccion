void main() {
  final Map<String, dynamic> rawJson = {
    'nombre': 'Tony Strak',
    'poder': 'Money',
    'vivo': true
  };

  //final iroman = Hero3(name: 'Tony Stark', power: 'Money', isAlive: false);
  final iroman = Hero3.otro(rawJson);
  print(iroman.toString());
}

class Hero {
  String name;
  String _power; //con guion bajo se pone privado

  Hero(this.name, [this._power = 'sin poderes']);

  String getPower() => _power;
  // Hero(String name,String power):name=name,power=power;
}

class Hero2 {
  String name;
  String power;

  Hero2({required this.name, this.power = 'sin poderes'});

  @override
  String toString() {
    return 'Hola mundo';
  }
}

class Hero3 {
  String name;
  String power;
  bool isAlive;

  Hero3.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? 'no name found',
        power = json['power'] ?? 'no power found',
        isAlive = json['isAlive'] ?? false;

  //Constructor de fábrica: Los constructores de fábrica se
  //utilizan para crear instancias de una clase de manera personalizada
  //y pueden tener un nombre.
  Hero3._privadon(
      {required this.name, required this.power, required this.isAlive});

  factory Hero3.otro(Map<String, dynamic> json) {
    return Hero3._privadon(
        name: json['nombre'] ?? 'no name found',
        power: json['poder'] ?? 'no power found',
        isAlive: json['vivo'] ?? false);
  }

  @override
  String toString() {
    return """ 
    nombre: $name
    poder: $power
    esta vivo? ${isAlive ? 'yes!!' : 'nou!!'}""";
  }
}
