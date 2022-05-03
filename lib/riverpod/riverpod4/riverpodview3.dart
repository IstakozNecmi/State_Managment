import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider4 = Provider((ref)=>0);

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // HookConsumerWidget allows using hooks inside the build method
    final state = useState(0);

    // We can also use the ref parameter to listen to providers.
    final counter = ref.watch(counterProvider4);
    return Text('$counter');
  }
}