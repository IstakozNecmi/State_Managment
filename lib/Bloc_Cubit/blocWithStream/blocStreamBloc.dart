import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutterhoooks/Bloc_Cubit/blocWithStream/blocStreaModel.dart';

class myBloc{

  final _stateStreamController = StreamController<List<Article>>();
  StreamSink get _stateSink => _stateStreamController.sink;
  Stream<List<Article>> get stateStream => _stateStreamController.stream;

  final _eventStreamController = StreamController();
  StreamSink get eventSink => _eventStreamController.sink;
  Stream get _eventStream => _eventStreamController.stream;


  myBloc(){
    _eventStream.listen((event)async { 
      if(event ==  States.Fetch){
        try{
          var news = await getNews();
          print("news = $news");
          _stateSink.add(news);
          
        }catch(e){
         _stateSink.addError("Something went wrong");
        }
      }
      if(event == States.Error){
        _stateSink.addError("ddffd");
      }
      if(event == States.delete){
        _stateSink.add([Article(title: "",id: 1)]);
      }
    });
  }


  Future<List<Article>> getNews()async{
    var client = http.Client();
    
    var modelim;
    try {
      var response = await client.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        List<dynamic> jsonMap = jsonDecode(jsonString);
        print(jsonMap);
        return jsonMap.map((e) => Article.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint("hata blocta = $e");
    }
    return [];
  }



}

//////////////////////////////////////////
enum States{Fetch,Loading,Loaded,Error,delete}