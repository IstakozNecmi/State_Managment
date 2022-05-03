import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class CountDown extends ValueNotifier<int>{

  late StreamSubscription sub;
  CountDown({required int from}) : super(from){
    sub = Stream.periodic(
      const Duration(seconds: 1),
      (v)=>from - v,
    ).takeWhile((element) => element>=0).listen((event) {
      value = event;
     });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    sub.cancel();
    super.dispose();
  }

}






Stream<String> getTime() => Stream.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now().toIso8601String(),
    );

extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([E? Function(T?)? transform]) =>
      map(transform ?? (e) => e).where((element) => element != null).cast();
}

const url =
    "https://upload.wikimedia.org/wikipedia/commons/e/e4/Hallstatt_300.jpg";

class flutterhooksviewclass1 extends HookWidget {
  const flutterhooksviewclass1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Build flutter hooks");
    ///////////////
    final countDown = useMemoized(()=>CountDown(from: 20));
    final notifier = useListenable(countDown);
    ////////////////
    //final dateTime = useStream(getTime());
    final controller = useTextEditingController();
    final text = useState("");
    useEffect(() {
      controller.addListener(() {
        text.value = controller.text;
      });
      return null;
    }, [controller]);
    

    final future = useMemoized(()=>NetworkAssetBundle(Uri.parse(url))
        .load(url)
        .then(
          (value) => value.buffer.asUint8List(),
        )
        .then(
          (value) => Image.memory(value),
        ));
    final snapshot = useFuture(future);  

    return Scaffold(
      appBar: AppBar(
        // title: Text(dateTime.data ?? "HomePage"),
        title: Text("HomePage"),
      ),
      body: Column(
        children: [
          
          TextField(
            controller: controller,
          ),
          Text("You typed ${text.value}"),
          Text(notifier.value.toString()),
          
          snapshot.data
        ].compactMap().toList(),
      ),
    );
  }
}
