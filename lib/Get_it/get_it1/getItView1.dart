

import 'package:flutter/material.dart';
import 'package:stateManangment/Get_it/get_it1/locator1.dart';


class getItViewClass extends StatefulWidget {
  getItViewClass({Key? key}) : super(key: key);

  @override
  State<getItViewClass> createState() => _getItViewClassState();
}

class _getItViewClassState extends State<getItViewClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text(locator1.get<getItCounter>().x.toString()),
            ElevatedButton(onPressed: (){
              setState(() {
                locator1.get<getItCounter>().increment();
              });
            }, child: Text("Arttır")),

          ],
        ),
      ),
    );
  }
}