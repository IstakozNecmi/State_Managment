import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stateManangment/Bloc_Cubit/bloc/bloc1/home/home.dart';
import 'package:stateManangment/Bloc_Cubit/bloc/bloc1/services/boredService.dart';
import 'package:stateManangment/Bloc_Cubit/bloc/bloc1/services/connectivityService.dart';


class blocviewclass1 extends StatelessWidget {
  const blocviewclass1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => BoredService(),
            ),
            RepositoryProvider(
              create: (context) => ConnectivityService(),
            )
          ],
          child: bloc1HomePage(),
        );
  }
}