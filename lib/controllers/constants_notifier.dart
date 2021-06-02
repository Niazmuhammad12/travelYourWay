

import 'package:flutter/cupertino.dart';

class ConstantsNotifier extends ChangeNotifier{
  int _showDrawer=0;
  int _index=0;

  void updateIndex(int ind){
   _index=ind;
    notifyListeners();
  }

  int get index => _index;

  void updateShowDrawer(int val){
   _showDrawer=val;
    notifyListeners();
  }

  int get showDrawer => _showDrawer;
}