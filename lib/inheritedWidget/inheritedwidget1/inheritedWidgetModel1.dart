import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Api {

  String? dateAndTime;

  Future<String> getDateAndTime(){

    return Future.delayed(const Duration(seconds: 1),()=>DateTime.now().toIso8601String(),)
    .then((value){
      dateAndTime = value;
      return value;
    });

  }


}


class ApiProvider extends InheritedWidget{

  final Api api;
  final String uuid;

  ApiProvider({Key? key,required this.api,required Widget child
  }) : uuid = const Uuid().v4(),super(key: key,child: child) ;

  @override
  bool updateShouldNotify(covariant ApiProvider oldWidget) {
    print(oldWidget);
    return uuid != oldWidget.uuid;
    
  }

  static ApiProvider of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ApiProvider>()!;
  }



}