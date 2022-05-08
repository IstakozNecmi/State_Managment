
import 'package:flutter/material.dart';
import 'package:stateManangment/inheritedWidget/inheritedWidget4/inheritedwidgetmodel4.dart';


class inheritedWidgetviewclass4 extends StatelessWidget {
  const inheritedWidgetviewclass4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountProvider(
      child:MyHomePage(title: "Title") , counter: CounterInherited4(5));
  }
}




class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  void _incrementCounter() {
    setState(() {
      //counterProvider.counter.increment();
      CountProvider.of(context).counter.increment();
    });
  }

  @override
  Widget build(BuildContext context) {
    var counterProvider = CountProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Inherited Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counterProvider.counter.count}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}