import 'package:flutter/cupertino.dart';

import 'package:mobx/mobx.dart';
import 'package:stateManangment/stacked/stacked_2_withMobx/stacked2_BaseViewModel.dart';


part 'stacked2_viewmodel.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store,BaseViewModel {

  

  @override
  void init() {
    debugPrint("Hayyyy");
  }

  @observable
  bool isLoading = false;

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  
}