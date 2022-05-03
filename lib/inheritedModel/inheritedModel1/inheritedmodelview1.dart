import 'package:flutter/material.dart';
import 'package:flutterhoooks/inheritedModel/inheritedModel1/inheritedmodelModel1.dart';
import 'dart:developer' as devtools show log;



class inheritedModelviewclass1 extends StatefulWidget {
  inheritedModelviewclass1({Key? key}) : super(key: key);

  @override
  State<inheritedModelviewclass1> createState() =>
      _inheritedModelviewclass11State();
}

class _inheritedModelviewclass11State extends State<inheritedModelviewclass1> {
  Color color1 = Colors.yellow;
  Color color2 = Colors.blue;

  @override
  Widget build(BuildContext context) {
    print("_inheritedModelviewclass11State");
    return Scaffold(
      appBar: AppBar(),
      body: AvailableColorsWidget(
          color1: color1,
          color2: color2,
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(onPressed: (){
                    setState(() {
                      color1 = colors.getRandomElement() ;
                    });
                  }, child: const Text("change color1")),
                  TextButton(onPressed: (){
                    setState(() {
                      color2 = colors.getRandomElement();
                    });
                  }, child: const Text("change color2")),
                ],
              ),
              //const önemli yoksa ikiside rebuild oluyorr
              const ColorWidget(color: AvailableColors.one),
              const ColorWidget(color: AvailableColors.two),
            ],
          )),
    );
  }
}

class ColorWidget extends StatelessWidget {
  final AvailableColors color;

  const ColorWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (color) {
      case AvailableColors.one:
        devtools.log("Color1 widget got rebuilt!");
        break;
      case AvailableColors.two:
        devtools.log("Color2 widget got rebuilt!");
        break;
      default:
    }

    final provider = AvailableColorsWidget.of(context, color);

    return Container(
      height: 100,
      color: color == AvailableColors.one ? provider.color1 : provider.color2,
    );
  }
}
