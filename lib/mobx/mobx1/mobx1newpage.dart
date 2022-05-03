import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterhoooks/mobx/mobx1/counter1.dart';
import 'package:mobx/mobx.dart';

class mobx1newpageview extends StatefulWidget {
  const mobx1newpageview({Key? key}) : super(key: key);

  @override
  mobx1newpageviewState createState() => mobx1newpageviewState();
}

class mobx1newpageviewState extends State<mobx1newpageview> {
  final Counter counter = Counter();

  @override
  Widget build(BuildContext context){
    print("Build 2");
    return Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('2.syafa'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                '2.sayfa pushed :',
              ),
              Observer(
                  builder: (_) => Text(
                        '${counter.value}',
                        style: const TextStyle(fontSize: 40),
                      )),
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