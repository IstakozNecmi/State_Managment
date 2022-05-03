
import 'package:flutter/material.dart';
import 'package:flutterhoooks/Bloc_Cubit/bloc/bloc3HydratedBlocOverrides/bloc/bloc_imports.dart';
import 'package:flutterhoooks/Bloc_Cubit/bloc/bloc3HydratedBlocOverrides/screen/home_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';




class blocviewHybratedStorageviewclass3 extends StatelessWidget {
  const blocviewHybratedStorageviewclass3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CounterBloc(),
      child: HomeScreenBlocHydratedoverride(),);
  }
}
