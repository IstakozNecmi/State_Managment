import 'package:flutter/material.dart';
import 'dart:math' show Random;
import 'dart:developer' as devtools show log;


enum AvailableColors {one,two}

class AvailableColorsWidget extends InheritedModel<AvailableColors> {

  final Color color1;
  final Color color2;

  AvailableColorsWidget({Key? key,required this.color1,required this.color2,required Widget child}) : super(key: key,child: child);

  static AvailableColorsWidget of(BuildContext context,AvailableColors aspect){
    return InheritedModel.inheritFrom<AvailableColorsWidget>(context,aspect: aspect,)!;
  }

  @override
  bool updateShouldNotify(covariant AvailableColorsWidget oldWidget) {
    devtools.log("updateShouldNotify");
    return color1 != oldWidget.color1 || color2 != oldWidget.color2;
    
    
  }

  @override
  bool updateShouldNotifyDependent(covariant AvailableColorsWidget oldWidget, Set<AvailableColors> dependencies) {
    
    devtools.log("updateShouldNotifyDependent");
    

    if(dependencies.contains(AvailableColors.one) && color1 != oldWidget.color1){
      print("dependencies 1 = $dependencies");
      return true;
    }

    if(dependencies.contains(AvailableColors.two) && color2 != oldWidget.color2){
      print("dependencies 2 = $dependencies");
      return true;
    }

    return false;
    

  }
}


final colors=[

  Colors.red,
  Colors.blue,
  Colors.orange,
  Colors.yellow,
  Colors.pink,
  Colors.black, 
  Colors.purple 

];



extension RandomElement<T> on Iterable<T>{

  T getRandomElement()=> elementAt(Random().nextInt(length));

}