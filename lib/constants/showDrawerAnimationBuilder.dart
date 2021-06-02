import 'dart:math';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:travel_your_way/controllers/constants_notifier.dart';

class DrawerAnimationBuilder extends StatelessWidget {
  final Widget child;

  const DrawerAnimationBuilder({Key key, this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(
            begin: 0,
            end: context
                .watch<ConstantsNotifier>()
                .showDrawer == 1 ? 1 : 0),
        duration: Duration(milliseconds: 300),
        builder: (_, double val, __) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)..setEntry(
                  0, 3, (MediaQuery
                  .of(context)
                  .size
                  .width / 2) * val)
              ..rotateY((pi / 6) * val),
            child: ClipRRect(
              borderRadius:
              context
                  .watch<ConstantsNotifier>()
                  .showDrawer == 1
                  ? BorderRadius.circular(12.0)
                  : BorderRadius.circular(0.0),
              child: child,
            ),

          );
        }
    );
  }
}
