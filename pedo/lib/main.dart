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
  int? _pasos_iniciales; //(historial + pasos actuales) - historial:inicial
  String _estado = "Waiting for...";
  Stream<StepCount>? _stepCountStream;
  Stream<PedestrianStatus>? _pedestrianStatusStream;

  @override
  void initState() { 
    super.initState();
    _initPermissions();
  }

  Future<void> _initPermissions() async {
    var status = await Permission.activityRecognition.request();

    if(status.isGranted){
      _initPedometer();
    } else {
      setState(() {
        _estado = "Permission Denied, Nigga";
      });
    }
  }

  void _initPedometer(){
    _stepCountStream = Pedometer.stepCountStream;
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;

    _stepCountStream!.listen(_onStepCount, onError: _onStepCountError);

    _pedestrianStatusStream!.listen(_onPedestrianStatusChanged, onError: _onPedestrianStatusError);
  }

  void _onStepCount(){

  }

  void _onStepCountError(){

  }

  void _onPedestrianStatusChanged(){

  }

  void _onPedestrianStatusError(){

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );

  }
}