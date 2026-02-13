import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _pasos = 0;
  int? _pasos_iniciales; //historial + pasos actuales
  String _estado = "Waiting for...";
  Stream<StepCount>? _stepCountStream;
  Stream<PedestrianStatus>? _pedestrianStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );

  }
}