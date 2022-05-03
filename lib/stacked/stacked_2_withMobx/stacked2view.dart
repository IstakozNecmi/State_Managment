import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterhoooks/stacked/stacked_2_withMobx/stacked2_viewmodel.dart';
import 'package:flutterhoooks/stacked/stacked_2_withMobx/stacked2basestate.dart';
import 'package:flutterhoooks/stacked/stacked_2_withMobx/stacked2baseview.dart';

class TestsView extends StatefulWidget {
  @override
  _TestsViewState createState() => _TestsViewState();
}

class _TestsViewState extends BaseState<TestsView> {
  late TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    print(dynamicHeight(0.5));
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        //model.setContext(context);
        viewModel = model;
        print(dynamicHeight(0.2));
      },
      onPageBuilder: (context, value) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: AppBar(),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber,
      );

  

  

  Widget get textNumber {
    print(dynamicHeight(0.5));
    return Column(
      children: <Widget>[
        Observer(
          builder: (context) => Text(
            viewModel.number.toString(),
          ),
        ),
      ],
    );
  }

  

  FloatingActionButton get floatingActionButtonNumberIncrement {
    return FloatingActionButton(
      onPressed: () => viewModel.incrementNumber(),
    );
  }
}