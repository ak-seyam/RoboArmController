import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:robot_arm_controller/model/motor_controller.dart';

class Motor extends StatelessWidget {
  Motor({this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<MotorControllerManager>(builder: (context, manager, _) {
      return Stack(
        children: <Widget>[
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(60))
            ),
          )
          ,Positioned(
            top: 10,
            left: 50,
            right: 50,
            child: Transform.rotate(
              angle: manager.controllers[index].value, // value is from (0 to 1)
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.blue),
                    height: 50,
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.red),
                    height: 50,
                    width: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
