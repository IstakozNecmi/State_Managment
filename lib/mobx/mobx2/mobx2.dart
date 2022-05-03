
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import 'package:flutterhoooks/mobx/mobx2/mobx2model.dart';


import 'package:mobx/mobx.dart';
part 'mobx2.g.dart';

class myMobx2 = _myMobx2Base with _$myMobx2;

abstract class _myMobx2Base with Store {
  
  @observable
  List<Post> posts = [];

  @observable
  PageState pageState = PageState.NORMAL;

  final url = "https://jsonplaceholder.typicode.com/posts";

  @observable
  bool isServiseReuquestLoading = false;

  @action
  Future<void> getAllPost() async {
    changeRequest();
    final response = await Dio().get(url);
    Future.delayed(Duration(seconds: 2));

    if (response.statusCode == HttpStatus.ok) {
      final responseData = response.data as List;
      posts = responseData.map((e) => Post.fromMap(e)).toList();
    }

    changeRequest();
  }

  @action
  Future<void> getAllPost2() async {
    pageState = PageState.LOADING;

    try {
      final response = await Dio().get(url);

      if (response.statusCode == HttpStatus.ok) {
        final responseData = response.data as List;
        posts = responseData.map((e) => Post.fromMap(e)).toList();
        pageState = PageState.SUCCESS;
      }
    } catch (e) {
      pageState = PageState.ERROR;
    }
  }

  @AndroidViewController.kActionPointerDown
  void changeRequest() {
    isServiseReuquestLoading = !isServiseReuquestLoading;
  }

  void name(args) {}

}

enum PageState { LOADING, ERROR, SUCCESS, NORMAL }