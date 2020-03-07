import 'dart:math';
import 'package:web_socket_channel/io.dart';

import 'package:flutter/cupertino.dart';

class MotorController {

  double _value = 0;
  // TODO: communication stuff...
  get value {
    return _value;
  }
  set value(double v){
    if(v > 0 && v <= 2*pi){
      this._value = v;
    }
  }
  communicate(index){
    //TODO: implement web socket communication stuff
    print("...COMMUNICATIONS... $index, $value");
  }
}
class MotorControllerManager with ChangeNotifier{
  List<MotorController> _controllers = List<MotorController>();
  var channel = IOWebSocketChannel.connect("ws://echo.websocket.org/");
  get controllers => this._controllers;
  attachNewController(MotorController m){
    _controllers.add(m);
  }
  changeValue(index,v){
    _controllers[index].value = v;
    _controllers[index].communicate(index);
    channel.sink.add('$v');
    notifyListeners();
  }
}