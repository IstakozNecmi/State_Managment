
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stateManangment/Bloc_Cubit/bloc/bloc3HydratedBlocOverrides/bloc/counter/counter_bloc.dart';
import 'package:stateManangment/Bloc_Cubit/bloc/bloc3HydratedBlocOverrides/screen/home_screen.dart';




class blocviewHybratedStorageviewclass3 extends StatelessWidget {
  const blocviewHybratedStorageviewclass3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CounterBloc(),
      child: HomeScreenBlocHydratedoverride(),);
  }
}
