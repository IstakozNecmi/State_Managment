import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:stateManangment/mobx/mobx2/mobx2.dart';



class mobx2viewclass extends StatelessWidget {
  mobx2viewclass({Key? key}) : super(key: key);
  final myMobx = myMobx2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            myMobx.getAllPost2();
          }, child: Text("Verileri getir")),

          Observer(builder: (context){
            switch (myMobx.pageState) {
        case PageState.LOADING:
          return CircularProgressIndicator();
        case PageState.SUCCESS:
          return ekran();

        case PageState.ERROR:
          return Center(child: Text("Error"));
        case PageState.NORMAL:
          return Center(child: Text("Noraml"),);  
        default:
          return FlutterLogo();
      }
          }),

        ],
      ),
    );

    
  }

    Widget ekran(){
      return Expanded(child: ListView.builder(
        itemCount: myMobx.posts.length,
        itemBuilder: (context,index){
        return ListTile(
          title: Text(myMobx.posts[index].title),
          leading: Text(myMobx.posts[index].id.toString()),
        );
      }),);
    }
}