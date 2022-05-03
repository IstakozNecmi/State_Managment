import 'package:flutter/widgets.dart';

class CountProvider extends InheritedWidget {
  final Widget child;
  final CounterInherited4 counter;
  CountProvider({Key? key,required this.child,required this.counter})
      : super(key: key, child: child);

  static CountProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CountProvider>()!;
  }

  @override
  bool updateShouldNotify(CountProvider oldWidget) {
    return true;
  }
}

class CounterInherited4 {
  int count;
  CounterInherited4(this.count);
  increment() {
    count++;
  }
}