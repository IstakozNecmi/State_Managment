import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:mobx/mobx.dart';
import 'package:stateManangment/mobx/mobx1/counter1.dart';
import 'package:stateManangment/mobx/mobx1/mobx1newpage.dart';

class mobxviewclass1 extends StatefulWidget {
  const mobxviewclass1({Key? key}) : super(key: key);

  @override
  mobxviewclass1State createState() => mobxviewclass1State();
}

class mobxviewclass1State extends State<mobxviewclass1> {
  final Counter counter = Counter();

  @override
  Widget build(BuildContext context){
    print("Build");
    return Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('MobX Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Observer(
                
                  builder: (_) => Text(
                        '${counter.value}',
                        style: const TextStyle(fontSize: 40),
                      )),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>mobx1newpageview()));
                      }, child: Text("nEXT PAGE")),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: counter.increment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
  }
}