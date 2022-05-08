

import 'package:get_it/get_it.dart';

final locator1 = GetIt.instance;

// setUp mainde çalışıyor
void setUp(){
  locator1.registerLazySingleton<getItCounter>(() => getItCounter());
}


class getItCounter{

  int x=0;

  increment(){
    x=x+1;
  }

}