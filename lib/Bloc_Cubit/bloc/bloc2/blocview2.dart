
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stateManangment/Bloc_Cubit/bloc/bloc2/bloc/counter/counter_bloc.dart';
import 'package:stateManangment/Bloc_Cubit/bloc/bloc2/screen/home_screen.dart';


class blocview2class extends StatelessWidget {
  const blocview2class({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocProvider(
          create: (context)=>CounterBloc() ,
          child: HomeScreenblocview2(),
          ),
      ),
    );
  }
}
