import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acelerometer App',
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double x = 0.0;
  double y = 0.0;
  double z = 0.0;

  @override
  void initState() { //Modificando el state
    super.initState(); 

    //Escuchar el evento del sensor
    // ignore: deprecated_member_use
    accelerometerEvents.listen((event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Accelerometer App"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text("Eje x: ${x.toStringAsFixed(2)}"),
            const SizedBox(height: 10),

            Text("Eje y: ${y.toStringAsFixed(2)}"),
            const SizedBox(height: 10),

            Text("Eje z: ${z.toStringAsFixed(2)}"),
            const SizedBox(height: 10),

            Text("Movete weon qliao")
          ],
        ),
      ),
    );
  }
}