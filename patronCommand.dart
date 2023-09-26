// Paso 1: Definir la interfaz Comando (Command)
abstract class Comando {
  void ejecutar();
}

// Paso 2: Crear una clase Receptor (Receiver)
class Luz {
  void encender() {
    print('Luz encendida');
  }

  void apagar() {
    print('Luz apagada');
  }
}

// Paso 3: Implementar clases de Comando concretas
class EncenderLuzCommand implements Comando {
  final Luz luz;

  EncenderLuzCommand(this.luz);

  @override
  void ejecutar() {
    luz.encender();
  }
}

class ApagarLuzCommand implements Comando {
  final Luz luz;

  ApagarLuzCommand(this.luz);

  @override
  void ejecutar() {
    luz.apagar();
  }
}

// Paso 4: Crear un Invocador (Invoker)
class ControlRemoto {
  late Comando _comando;

  void setComando(Comando comando) {
    _comando = comando;
  }

  void presionarBoton() {
    _comando.ejecutar();
  }
}

// Paso 5: Cliente
void main() {
  final luz = Luz();
  final encenderLuz = EncenderLuzCommand(luz);
  final apagarLuz = ApagarLuzCommand(luz);

  final controlRemoto = ControlRemoto();

  controlRemoto.setComando(encenderLuz);
  controlRemoto.presionarBoton(); // Enciende la luz

  controlRemoto.setComando(apagarLuz);
  controlRemoto.presionarBoton(); // Apaga la luz
}
