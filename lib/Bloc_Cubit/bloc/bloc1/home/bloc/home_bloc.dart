import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:stateManangment/Bloc_Cubit/bloc/bloc1/services/boredService.dart';
import 'package:stateManangment/Bloc_Cubit/bloc/bloc1/services/connectivityService.dart';



part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BoredService _boredService;
  final ConnectivityService _connectivityService;

  HomeBloc(this._boredService, this._connectivityService) : super(HomeLoadingState()) {
    print("Connectiviy deneme");
    _connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print('no internet add NoInterhnetEvent');
        add(NoInternetEvent());
      } else {
        print('yes internet add loadApiEvent');
        add(LoadApiEvent());
      }
    });

    on<LoadApiEvent>((event, emit) async {
      print("on LoadApiEvent");
      emit(HomeLoadingState());
      print("event = ${event.props}");
      final activity = await _boredService.getBoredActivity();
      emit(HomeLoadedState(activity.activity, activity.type, activity.participants));
    });

    on<NoInternetEvent>((event, emit) {
      print("on NoInternetEvent");
      emit(HomeNoInternetState());
    });
  }
}
