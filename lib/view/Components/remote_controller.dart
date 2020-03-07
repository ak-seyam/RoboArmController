import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:robot_arm_controller/model/motor_controller.dart';
import 'package:robot_arm_controller/view/Components/motor.dart';

class RemoteController extends StatelessWidget {
  RemoteController({this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    Provider.of<MotorControllerManager>(context)
        .attachNewController(MotorController());
    return Consumer<MotorControllerManager>(
      builder: (context, manager, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Motor(
              index: index,
            )
            ,Slider(
              onChanged: (v) {
                manager.changeValue(index, v);
              },
              value: manager.controllers[index].value,
              min: 0,
              max: 2*pi,
            ),
            StreamBuilder(
              stream: manager.channel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            )
          ],
        );
      },
    );
  }
}
