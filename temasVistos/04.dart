void main() {
  final numbers = [1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 9, 10];
  print('Listado: $numbers');
  print('tamaño: ${numbers.length}');
  print('Inde 0: ${numbers[0]}');
  print('First: ${numbers.first}');
  print('Alreves: ${numbers.reversed}');

  final reverseNumbers = numbers.reversed;

  print('Iterable: ${reverseNumbers.toList()}');
  print('List: ${reverseNumbers.toList()}');
  print('Set: ${reverseNumbers.toSet()}');
  print('Set: ${reverseNumbers.toSet().toList().reversed.toSet()}');

  final resultNumberGreaterThan5 = numbers.where(numberIsGreaterThanFive);
  final numberSmallerThan5 = numbers.where(numberIsSmallerThanFive);
  print(resultNumberGreaterThan5);
  print(numberSmallerThan5);
}

bool numberIsGreaterThanFive(int number) => number > 5;
bool numberIsSmallerThanFive(int number) => number < 5;
