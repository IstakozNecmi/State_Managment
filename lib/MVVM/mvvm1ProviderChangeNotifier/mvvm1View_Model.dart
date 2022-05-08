
import 'package:flutter/material.dart';
import 'package:stateManangment/MVVM/mvvm1ProviderChangeNotifier/mvvm1Model.dart';



class ViewModel extends ChangeNotifier {
  Model model = Model();

  get counter => model.counter;

  void addCounter() {
    model.counter++;
    notifyListeners();
  }

  setTitle(String title) {
    model.title = title;
    notifyListeners();
  }


}