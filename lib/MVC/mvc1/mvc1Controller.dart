

import 'package:flutterhoooks/MVC/mvc1/mvc1Model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

//extend ControllerMVC demesekte çalışıyor
class Controller extends ControllerMVC {
  factory Controller() {
    if (_this == null) _this = Controller._();
    return _this;
  }
  static Controller _this = Controller._();
  Controller._();

  int get counter => Model.counter;
  void increment() {
    Model.increment();
  }

  void decrement() {
    Model.decrement();
  }
}