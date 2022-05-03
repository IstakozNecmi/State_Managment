import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProviderRiverpod = ChangeNotifierProvider((ref){
  return CounterProvider();
  
});


class CounterProvider extends ChangeNotifier{

  int _counter;
  CounterProvider([this._counter=10]);

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