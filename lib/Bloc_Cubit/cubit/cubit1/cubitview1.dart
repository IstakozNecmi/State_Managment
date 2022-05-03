import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterhoooks/Bloc_Cubit/cubit/cubit1/cubitmodel1.dart';
import 'package:flutterhoooks/mobx/mobx1/counter1.dart';

class cubitviewclass1 extends StatelessWidget {
  const cubitviewclass1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(0),
      child: cubitviewclass11(),
    );
  }
}

class cubitviewclass11 extends StatelessWidget {
  final myCubit = CounterCubit(5);
  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Column(
        children: [
          BlocBuilder<CounterCubit, int>(
            buildWhen: (previousState, state) {
            debugPrint("PreviousState 1= $previousState");
            debugPrint("state now 1= $state");
            return true;
            //return false ise alttaki builder çalışmıyor
          }, builder: (context, count) {
            debugPrint("BlocBuilder 1");
            return Center(child: Text('$count'));
          }),
          /////////////////////////////////////////////////////////
          ///
          ///
          BlocBuilder<CounterCubit, int>(
              bloc: myCubit,
              builder: (context, count2) {
                print("BlocBuilder 2");
                return Center(child: Text('$count2'));
              }),
          /////////////////////////////////////////////////////////
          BlocSelector<CounterCubit, int, bool>(selector: (selected) {
            return selected % 2 == 0 ? true : false;
          }, builder: (context, count3) {
            return Center(
              child: Text(count3.toString()),
            );
          }),
          /////////////////////////////////////////////////////////
          // blocListener widget döndürmez bunu navigasyon işlemlerinde toast barlarda kullan
          //blocConsumerda blocListener ile BlocBuilderin karışımı 
          BlocListener<CounterCubit, int>(listenWhen: (context, count4) {
            return count4 > 5 && count4 < 7;
          }, listener: (context, count4) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('A SnackBar has been shown.'),
              ),
            );
          },
          child: Container(color: Colors.red,),
          ),
        ],
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "1",
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            heroTag: "2",
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
          FloatingActionButton(
              heroTag: "DiğerİnstanceCubitiBu",
              child: const Icon(Icons.abc),
              onPressed: () => myCubit.increment()),
          FloatingActionButton(
            heroTag: "BlocSelected",
            child: const Icon(Icons.abc),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
        ],
      ),
    );
  }
}
