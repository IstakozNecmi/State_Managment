import 'package:flutter/material.dart';

//Step#1 Implementing InheritedWidget
class DataHolderAndProvider extends InheritedWidget {
  final data;

  DataHolderAndProvider({this.data, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(DataHolderAndProvider oldWidget) {
    return data != oldWidget.data;
  }

  static DataHolderAndProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataHolderAndProvider>()!;
  }
}

//Step#2 Use InheritedWidget as a root widget
class inheritewidgerviewclass3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple IW Eample'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Text('below we are using IW'),
            Divider(
              height: 2,
              color: Colors.amber,
            ),
            DataHolderAndProvider(
                data: ['Coding', 'Hive'], child: FirstChildOfIW())
          ],
        ),
      ),
    );
  }
}

//Step#3 Get data in child widget
class FirstChildOfIW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = DataHolderAndProvider.of(context).data;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text('FirstChildOfIW: User First Name: ${data[0]}'),
          buttonpress3(),
        ],
      ),
    );
  }
}

class buttonpress3 extends StatefulWidget {
  buttonpress3({Key? key}) : super(key: key);

  @override
  State<buttonpress3> createState() => _buttonpress3State();
}

class _buttonpress3State extends State<buttonpress3> {
  @override
  Widget build(BuildContext context) {
    
    final data = DataHolderAndProvider.of(context).data;
    return ElevatedButton(
        onPressed: () {
          data[0] = data[0] + "1";
          
          setState(() {});
        },
        child: Text("${data[0]}"));
  }
}
