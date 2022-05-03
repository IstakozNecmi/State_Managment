import 'package:flutter/material.dart';

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandEqually() => map((e) => Expanded(child: e));
}

class SliderData extends ChangeNotifier {
  double _value = 0.0;
  double get value => _value;

  set value(double newValue) {
    if (newValue != _value) {
      _value = newValue;
      notifyListeners();
    }
  }
}

final sliderData = SliderData();

class SliderInheritedNotifier extends InheritedNotifier<SliderData> {
  SliderInheritedNotifier({
    Key? key,
    required Widget child,
    required SliderData sliderData,
  }) : super(child: child, key: key, notifier: sliderData);

  static double of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<SliderInheritedNotifier>()
          ?.notifier
          ?.value ??
      0.0;
}
