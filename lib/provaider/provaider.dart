import 'package:flutter/cupertino.dart';

class VMCController with ChangeNotifier{
   late bool isLoading ;

  void init(bool value){
    isLoading = value;
    notifyListeners();
  }
}
