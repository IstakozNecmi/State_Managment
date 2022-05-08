import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stateManangment/Bloc_Cubit/bloc/BlocOynatmaListesi/3/blocOynatmaListesiview3.dart';
import 'package:stateManangment/Bloc_Cubit/bloc/bloc1/blocview1.dart';
import 'package:stateManangment/Bloc_Cubit/bloc/bloc2/blocview2.dart';
import 'package:stateManangment/Bloc_Cubit/bloc/bloc3HydratedBlocOverrides/blochyratedOverrieesview3.dart';
import 'package:stateManangment/Bloc_Cubit/blocWithStream/blocstreamview.dart';
import 'package:stateManangment/Bloc_Cubit/cubit/cubit1/cubitview1.dart';
import 'package:stateManangment/Get_it/get_it1/getItView1.dart';
import 'package:stateManangment/MVC/mvc1/mvc1View.dart';
import 'package:stateManangment/MVVM/mvvm1ProviderChangeNotifier/mvvm1View.dart';
import 'package:stateManangment/changeNotifier/changeNotifier1_riverpod/changenotifierview1.dart';
import 'package:stateManangment/changeNotifier/changeNotifier2_animatedBuilder/changenotifierview2.dart';
import 'package:stateManangment/flutter_hooks/fllutter_hooks1/flutter_hooks_view1.dart';
import 'package:stateManangment/flutter_hooks/flutter_hooks2/flutter_hooksview2.dart';
import 'package:stateManangment/flutter_hooks/flutter_hooks3/flutter_hooks_view3.dart';
import 'package:stateManangment/inheritedModel/inheritedModel1/inheritedmodelview1.dart';
import 'package:stateManangment/inheritedNotifier/inheritedNotifier1/inheritedNotifierview1.dart';
import 'package:stateManangment/inheritedWidget/inheritedWidget2/inheritedwidgetview2.dart';
import 'package:stateManangment/inheritedWidget/inheritedWidget4/inheritedwidgetview4.dart';
import 'package:stateManangment/inheritedWidget/inheritedwidget1/inheritedWidgetview1.dart';
import 'package:stateManangment/mobx/mobx1/mobxview1.dart';
import 'package:stateManangment/mobx/mobx2/mobx2view.dart';
import 'package:stateManangment/riverpod/riverpod1counter/riverpodview1.dart';
import 'package:stateManangment/riverpod/riverpod2todo/riverpod2view.dart';
import 'package:stateManangment/riverpod/riverpod3/riverpodview3.dart';
import 'package:stateManangment/riverpod/riverpod4/riverpodview3.dart';
import 'package:stateManangment/stacked/stacked1/stacked1view.dart';
import 'package:stateManangment/stacked/stacked_2_withMobx/stacked2view.dart';
import 'package:stateManangment/stateNotifier/statenotifier1/statenotifierview1.dart';
import 'package:stateManangment/valueNotifier/valueNotifier1/valuenotifier1view.dart';
import 'package:stateManangment/valueNotifier/valueNotifier2/valuenotifier2view.dart';

import 'Get_it/get_it1/locator1.dart';
import 'inheritedWidget/inheritedWidget3/inheritedWidgetview3.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  setUp();
      
  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp()),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      
      child: MaterialApp(
      home: Home(),
    ));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Wrap(
        children: [
           navigasyonGo(context,ValueNotifier1class(),"ValueNotifier1"),
           navigasyonGo(context,valueNotifier2class(),"ValueNotifier2"),
           navigasyonGo(context,changenotifierclass1(),"changeNotifier1"),
           navigasyonGo(context,changenotifier2class(),"changeNotifier2"),
           navigasyonGo(context,statenotifierview1(),"stateNotifier1"),
           navigasyonGo(context,inheritedwidgetviewclass11(),"inheritedWidget1"),
           navigasyonGo(context,inheritedwidgetview2class(),"inheritedWidget2"),
           navigasyonGo(context,inheritewidgerviewclass3(),"inheritedWidget3"),
           navigasyonGo(context,inheritedWidgetviewclass4(),"inheritedWidget4"),
           navigasyonGo(context,inheritedModelviewclass1(),"inheritedModel1"),
           navigasyonGo(context,inheritedNotifierviewclass1(),"inheritedNotifier1"),
           navigasyonGo(context,flutterhooksviewclass1(),"flutter_hooks1"),
           navigasyonGo(context,flutterhooksviewclass2(),"flutter_hooks2"),
           navigasyonGo(context,flutterhooksviewclass3(),"flutter_hooks3"),
           navigasyonGo(context,mobxviewclass1(),"mobx1"),
           navigasyonGo(context,mobx2viewclass(),"mobx2"),
           navigasyonGo(context,cubitviewclass1(),"cubit"),
            navigasyonGo(context,blocviewclass1(),"bloc1"),
            navigasyonGo(context,blocOynatmaListesiviewclass3(),"BlocO3"),
            navigasyonGo(context,blocStreamclass1(),"BlocStream"),
            navigasyonGo(context,blocview2class(),"bloc2"),
            navigasyonGo(context,blocviewHybratedStorageviewclass3(),"bloc3 Hybrated"),
             navigasyonGo(context,riverpodview1(),"riverpod1"),
             navigasyonGo(context,riverpodtodo2view(),"riverpod2todo"),
             navigasyonGo(context,riverpodview3(),"riverpod3"),
             navigasyonGo(context,HomeView(),"riverpod4"),
             navigasyonGo(context,stacked1viewclass(),"stacked1"),
             navigasyonGo(context,TestsView(),"stacked2"),
             navigasyonGo(context,mvc1Viewclass(),"MVC1"),
             navigasyonGo(context,mvvm1Viewclass(),"MVVM1"),
             navigasyonGo(context,getItViewClass(),"Get_It1"),
             
            
           
           

        ],
      )
    
    );
  }
}

Widget navigasyonGo(BuildContext context,Widget child,String isim){

  return ElevatedButton(onPressed: ()async{
    await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>child));
  }, child: Text(isim));
}