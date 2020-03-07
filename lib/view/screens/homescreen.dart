import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:robot_arm_controller/model/motor_controller.dart';
import 'package:robot_arm_controller/view/Components/remote_controller.dart';

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> MotorControllerManager(),
      child: Scaffold(
        body: RemoteController(
          index: 0,
        ),
      ),
    );
  }
}
