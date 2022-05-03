class Model {
  static int _counter = 0;
  //GETTER
  static int get counter => _counter;
  //SETTER
  static int increment() => ++_counter;
  static int decrement() => --_counter;
}