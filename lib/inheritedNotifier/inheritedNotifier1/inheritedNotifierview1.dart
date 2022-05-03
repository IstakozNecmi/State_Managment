import 'package:flutter/material.dart';
import 'package:flutterhoooks/inheritedNotifier/inheritedNotifier1/inheritedNotifiermodel1.dart';

class inheritedNotifierviewclass1 extends StatefulWidget {
  inheritedNotifierviewclass1({Key? key}) : super(key: key);

  @override
  State<inheritedNotifierviewclass1> createState() =>
      _inheritedNotifierviewclass1State();
}

class _inheritedNotifierviewclass1State
    extends State<inheritedNotifierviewclass1> {
  @override
  Widget build(BuildContext context) {
    print("üst build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SliderInheritedNotifier(
        sliderData: sliderData,
        child: Builder(builder: (context){
          print("alt build");
          
          return Column(
          children: [
            Slider(
                value: SliderInheritedNotifier.of(context),
                onChanged: (value) {
                  sliderData.value = value;
                }),
            Row(
              children: [
                Opacity(
                  opacity: SliderInheritedNotifier.of(context),
                  child: Container(
                    color: Colors.yellow,
                    height: 200,
                  ),
                ),
                Opacity(
                  opacity: SliderInheritedNotifier.of(context),
                  child: Container(
                    color: Colors.blue,
                    height: 200,
                  ),
                )
              ].expandEqually().toList(),
            )
          ],
        );}),
      ),
    );
  }
}
