import 'package:flutter/material.dart';
import 'package:flutterhoooks/changeNotifier/changeNotifier2_animatedBuilder/changenotifiermodel2.dart';



class changenotifier2class extends StatelessWidget {
  changenotifier2class({Key? key}) : super(key: key);

  var changeim = CounterProvider2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  changeim.increment();
                }, child: Text("Arttır")),
                ElevatedButton(onPressed: (){
                  changeim.decrement();
                }, child: Text("Azalt")),
              ],
            ),
            AnimatedBuilder(
          animation: changeim,
          builder: (context,child){
            return Text("${changeim.counter}");
          }),
          ],
        )
      ),
    );
  }
}