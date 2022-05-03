import 'package:flutter/material.dart';

class CounterProvider2 extends ChangeNotifier{

  int _counter;
  CounterProvider2([this._counter=10]);

  int get counter =>_counter;

  void increment(){
    _counter++;
    notifyListeners();
  }

  void decrement(){

    _counter--;
    notifyListeners();
  }


}