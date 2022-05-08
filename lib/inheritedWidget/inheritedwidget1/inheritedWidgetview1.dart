import 'package:flutter/material.dart';
import 'package:stateManangment/inheritedWidget/inheritedwidget1/inheritedWidgetModel1.dart';



class inheritedwidgetviewclass11 extends StatelessWidget {
  const inheritedwidgetviewclass11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApiProvider(
      api: Api(),
      child: inheritedwidgetviewclass1());
  }
}


class inheritedwidgetviewclass1 extends StatefulWidget {
  inheritedwidgetviewclass1({Key? key}) : super(key: key);

  @override
  State<inheritedwidgetviewclass1> createState() => _inheritedwidgetviewclass1State();
}

class _inheritedwidgetviewclass1State extends State<inheritedwidgetviewclass1> {

  String title = "Tap the scree";
  ValueKey _textKey = const ValueKey<String?>(null);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ApiProvider.of(context).api.dateAndTime ?? ""),
      ),
      body: GestureDetector(
        onTap: ()async{
          final api = ApiProvider.of(context).api;
          final dateAndTime = await api.getDateAndTime();
          print("1 uuid = "+ApiProvider.of(context).uuid);
          setState(() {
            _textKey = ValueKey(dateAndTime);
          
          });
        },
        child: SizedBox.expand(
          child: Container(
          color: Colors.white,
          child: DateTimeWidget(key: _textKey,),
          //child: DateTimeWidget(),
        ),
        ),
      ),
    );
  }
}


class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("2 uuid = "+ApiProvider.of(context).uuid);
    final api = ApiProvider.of(context).api;
    return Text(api.dateAndTime ?? "Tap on screen to fetch date and time");
  }
}