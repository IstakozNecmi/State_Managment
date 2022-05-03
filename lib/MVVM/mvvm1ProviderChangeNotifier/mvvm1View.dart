import 'package:flutter/material.dart';
import 'package:flutterhoooks/MVVM/mvvm1ProviderChangeNotifier/mvvm1View_Model.dart';
import 'package:provider/provider.dart';

class mvvm1Viewclass extends StatefulWidget {
  mvvm1Viewclass({Key? key}) : super(key: key);

  @override
  State<mvvm1Viewclass> createState() => _mvvm1ViewclassState();
}

class _mvvm1ViewclassState extends State<mvvm1Viewclass> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (_) => ViewModel()),
      ],
      child: mvvm1HomePage(),
      
    );
  }
}

class mvvm1HomePage extends StatefulWidget {
  mvvm1HomePage({Key? key}) : super(key: key);

  @override
  State<mvvm1HomePage> createState() => _mvvm1HomePageState();
}

class _mvvm1HomePageState extends State<mvvm1HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ViewModel>();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.model.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${viewModel.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
        heroTag: "1",
        onPressed: () => viewModel.addCounter(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      FloatingActionButton(
        heroTag: "2",
        onPressed: () => viewModel.setTitle(DateTime.now().toIso8601String()),
        tooltip: 'title',
        child: Icon(Icons.change_circle),
      ),
        ],
      )
      
    );
  }
}