import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final counterProvider1 = StateProvider.autoDispose<int>((ref) => 0);
//final counterProvider1 = StateProvider((ref) => 0);

class riverpodview1 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //listen rebuild etmez fonksiyon çallıştırır watch rebuild eder
    ref.listen<int>(counterProvider1, (int? previousCount, int newCount) {
    print('previous = $previousCount  -----  new = $newCount');
  });
    print("Build");
    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Center(
        // Consumer is a widget that allows you reading providers.
        child: Column(
          children: [
            Consumer(
              
          builder: (context, ref, _) {
            print("consumer");
          final count = ref.watch(counterProvider1.state).state;
          return Text('$count');
        }),
        Text("consumer Dışında "+ref.watch(counterProvider1.state).state.toString()),
        ElevatedButton(onPressed: (){ref.refresh(counterProvider1);}, child: Text("Reset")),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is a utility to read a provider without listening to it
        onPressed: () => ref.read(counterProvider1.state).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}