import 'package:flutter/material.dart';
import 'package:stateManangment/Bloc_Cubit/blocWithStream/blocStreaModel.dart';
import 'package:stateManangment/Bloc_Cubit/blocWithStream/blocStreamBloc.dart';


class blocStreamclass1 extends StatefulWidget {
  const blocStreamclass1({Key? key}) : super(key: key);

  @override
  State<blocStreamclass1> createState() => _blocStreamclass1State();
}

class _blocStreamclass1State extends State<blocStreamclass1> {

  final mybloc = myBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mybloc.eventSink.add(States.Fetch);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: StreamBuilder<List<Article>>(
          initialData: [Article(title: "başlık",id: 2)],
          stream: mybloc.stateStream,
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  var gelenArticle = snapshot.data![index];
                  return ListTile(
                    title: Text(gelenArticle.title.toString()),
                    leading: Text(gelenArticle.id.toString()),
                  );
              });
            }
            if(snapshot.hasError){
              return Container(child: Text("Hata = ${snapshot.error}"),);
            }
            return Container(
              child: Text("hiçbişi"),
            );
          }),
          
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.delete),
            heroTag: "Delete",
            onPressed: (){
              mybloc.eventSink.add(States.delete);
            }),
            FloatingActionButton(
              child: Icon(Icons.add),
            heroTag: "fetch",
            onPressed: (){
              mybloc.eventSink.add(States.Fetch);
            }),
            FloatingActionButton(
              child: Icon(Icons.error),
            heroTag: "error",
            onPressed: (){
              mybloc.eventSink.add(States.Error);
            }),
        ],
      ),  
    );
    
  }
}