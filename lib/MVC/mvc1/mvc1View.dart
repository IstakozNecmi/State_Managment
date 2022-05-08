import 'package:flutter/material.dart';
import 'package:stateManangment/MVC/mvc1/mvc1Controller.dart';



class mvc1Viewclass extends StatefulWidget {
  const mvc1Viewclass({Key? key}) : super(key: key);

  @override
  _mvc1ViewclassState createState() => _mvc1ViewclassState();
}

class _mvc1ViewclassState extends State<mvc1Viewclass> {
  final Controller _controller = Controller();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("MVC App"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _controller != null ? '${_controller.counter}' : "0",
                style: TextStyle(fontSize: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: "1",
                    onPressed: () {
                      setState(() {
                        _controller.increment();
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    heroTag: "2",
                    onPressed: () {
                      setState(() {
                        _controller.decrement();
                      });
                    },
                    child: Icon(Icons.remove),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}