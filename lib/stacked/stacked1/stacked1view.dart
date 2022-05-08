


import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stateManangment/stacked/stacked1/stackedmodel.dart';

class stacked1viewclass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build");
    // Using the reactive constructor gives you the traditional ViewModel
    // binding which will execute the builder again when notifyListeners is called.
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            viewModel.updateTitle();
          },
        ),
        body: Center(
          child: Text(viewModel.title),
        ),
      ),
    );
  }
}

