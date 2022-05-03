import 'dart:math';

import 'package:flutter/material.dart';



class valueNotifier2class extends StatelessWidget {

  ValueNotifier<List<String>> numbers = ValueNotifier(['123']);
  
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(),
        body: ValueListenableBuilder(
          valueListenable: numbers,
          builder: (BuildContext context, List<String> nums, Widget? child) {
            return ListView.builder(
              itemCount: nums.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(nums[index]),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.star),
          onPressed: () {

            var randomSayi =Random().nextInt(1000).toString(); 


            //numbers.value.add(randomSayi);
            //numbers.notifyListeners();

            numbers.value = List.from(numbers.value)..add(randomSayi); 

            //numbers.value = ["3434","344343","344433434"]; 
            
            
          },
        ),
      
    );
  }
}