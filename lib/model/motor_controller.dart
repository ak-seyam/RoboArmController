import 'dart:math';
import 'package:web_socket_channel/io.dart';

import 'package:flutter/cupertino.dart';

class MotorController {

  double _value = 0;
  get value {
    return _value;
  }
  set value(double v){
    if(v > 0 && v <= 2*pi){
      this._value = v;
    }
  }
  communicate(index){
    var channel = IOWebSocketChannel.connect("ws://echo.websocket.org/");
    channel.sink.add('$value');
    print("...COMMUNICATIONS... $index, $value");
  }
}
class MotorControllerManager with ChangeNotifier{
  List<MotorController> _controllers = List<MotorController>();
  get controllers => this._controllers;
  attachNewController(MotorController m){
    _controllers.add(m);
  }
  changeValue(index,v){
    _controllers[index].value = v;
    _controllers[index].communicate(index);
    notifyListeners();
  }
}
