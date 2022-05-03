// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx2.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$myMobx2 on _myMobx2Base, Store {
  late final _$postsAtom = Atom(name: '_myMobx2Base.posts', context: context);

  @override
  List<Post> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<Post> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$pageStateAtom =
      Atom(name: '_myMobx2Base.pageState', context: context);

  @override
  PageState get pageState {
    _$pageStateAtom.reportRead();
    return super.pageState;
  }

  @override
  set pageState(PageState value) {
    _$pageStateAtom.reportWrite(value, super.pageState, () {
      super.pageState = value;
    });
  }

  late final _$isServiseReuquestLoadingAtom =
      Atom(name: '_myMobx2Base.isServiseReuquestLoading', context: context);

  @override
  bool get isServiseReuquestLoading {
    _$isServiseReuquestLoadingAtom.reportRead();
    return super.isServiseReuquestLoading;
  }

  @override
  set isServiseReuquestLoading(bool value) {
    _$isServiseReuquestLoadingAtom
        .reportWrite(value, super.isServiseReuquestLoading, () {
      super.isServiseReuquestLoading = value;
    });
  }

  late final _$getAllPostAsyncAction =
      AsyncAction('_myMobx2Base.getAllPost', context: context);

  @override
  Future<void> getAllPost() {
    return _$getAllPostAsyncAction.run(() => super.getAllPost());
  }

  late final _$getAllPost2AsyncAction =
      AsyncAction('_myMobx2Base.getAllPost2', context: context);

  @override
  Future<void> getAllPost2() {
    return _$getAllPost2AsyncAction.run(() => super.getAllPost2());
  }

  @override
  String toString() {
    return '''
posts: ${posts},
pageState: ${pageState},
isServiseReuquestLoading: ${isServiseReuquestLoading}
    ''';
  }
}
