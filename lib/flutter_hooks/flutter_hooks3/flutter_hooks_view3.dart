import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const url =
    "https://upload.wikimedia.org/wikipedia/commons/e/e4/Hallstatt_300.jpg";




class flutterhooksviewclass3 extends HookWidget {
  const flutterhooksviewclass3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final StreamController<double> controller;
    controller = useStreamController<double>(onListen: (){
      controller.sink.add(0.0);
    });
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: controller.stream,
        builder: (context,AsyncSnapshot<double?> snapshot){
        final rotation = snapshot.data ?? 0.0;
        if(!snapshot.hasData){
          return CircularProgressIndicator();
        }else{
          return GestureDetector(
          onTap: (){
            controller.sink.add(rotation + 10.0);
          },
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(rotation / 360.0),
            child: Center(
              child: Image.network(url),
            ),
          ),
        );
        }
      })
    );
  }
}
