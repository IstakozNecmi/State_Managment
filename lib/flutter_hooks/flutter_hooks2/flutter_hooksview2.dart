import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const url =
    "https://upload.wikimedia.org/wikipedia/commons/e/e4/Hallstatt_300.jpg";
const imageHeight = 300.0;

extension Normalize on num {
  num normalized(num selfRangeMin, num SelfRangeMax,
          [num normalizedRangeMin = 0.0, num normalizedRangeMax = 1.0]) =>
      (normalizedRangeMax - normalizedRangeMin) *
          ((this - selfRangeMin) / (SelfRangeMax - selfRangeMin)) +
      normalizedRangeMin;
}

class flutterhooksviewclass2 extends HookWidget {
  const flutterhooksviewclass2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Build hook2");

    final size = useAnimationController(
        duration: const Duration(seconds: 1),
        initialValue: 1.0,
        lowerBound: 0.0,
        upperBound: 1.0);

    final opacity = useAnimationController(
        duration: const Duration(seconds: 1),
        initialValue: 1.0,
        lowerBound: 0.0,
        upperBound: 1.0);

    final controller = useScrollController();

    useEffect(() {
      controller.addListener(() {
        final newOpacity = max(imageHeight - controller.offset, 0.0);
        final normalized = newOpacity.normalized(0.0, imageHeight).toDouble();
        opacity.value = normalized;
        size.value = normalized;
      });
      
      return null;
    }, [controller]);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizeTransition(
            sizeFactor: size,
            axis: Axis.vertical,
            axisAlignment: -1.0,
            child: FadeTransition(
              opacity: opacity,
              child: Image.network(
                url,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                controller: controller,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Person ${index + 1}"),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
