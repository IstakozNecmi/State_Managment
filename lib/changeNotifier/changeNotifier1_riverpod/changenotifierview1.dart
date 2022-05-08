import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stateManangment/changeNotifier/changeNotifier1_riverpod/changeNotifiermodel1.dart';



class changenotifierclass1 extends ConsumerWidget {
  const changenotifierclass1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    print("Build çalıştı");
    var referens = ref.watch(counterProviderRiverpod);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  ref.read(counterProviderRiverpod).increment();
                  
                }, child: Text("Arttır")),
                ElevatedButton(onPressed: (){
                  referens.decrement();
                }, child: Text("Azalt")),
              ],
            ),
            Text(referens.counter.toString()),
            Text("Bu consumer dışında"),
            Consumer(builder:(context,ref,child){
              
              print("Consumer Çalıştı");
              final numberProvider = ref.watch(counterProviderRiverpod);

              return Text("Counter using consumer = ${numberProvider.counter}");
            }),
          ],
        ),
      ),
    );
  }
}