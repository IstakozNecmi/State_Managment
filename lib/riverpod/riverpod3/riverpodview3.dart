import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider3 = Provider((ref)=>0);
//sadece okunur değiştirilmez

//consumer statefull ve consumerstate ref yazamna gerek yok ref içinde
class riverpodview3 extends ConsumerStatefulWidget {
  const riverpodview3({Key? key}): super(key: key);

  @override
  riverpodview3State createState() => riverpodview3State();
}

class riverpodview3State extends ConsumerState<riverpodview3> {
  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    ref.read(counterProvider3);
  }

  @override
  Widget build(BuildContext context) {
    // We can also use "ref" to listen to a provider inside the build method
    final counter = ref.watch(counterProvider3);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('$counter'),
          
        ],
      ),
    );
  }
}