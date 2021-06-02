import 'package:flutter/material.dart';
import 'package:travel_your_way/controllers/constants_notifier.dart';
import 'package:provider/provider.dart';

class SwipeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (e){
        if(e.delta.dx>0){
          context.read<ConstantsNotifier>().updateShowDrawer(1);
        }
        else{
          context.read<ConstantsNotifier>().updateShowDrawer(0);
        }
      },
    );
  }
}
