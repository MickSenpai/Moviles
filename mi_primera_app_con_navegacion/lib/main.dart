import 'package:flutter/material.dart';
import 'Screen2.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pantalla de inicio',
      home: Pantalla1(),
    );
  }
}

class Pantalla1 extends StatefulWidget {
  Pantalla1({Key? key}) : super(key: key);

  @override
  _Pantalla1State createState() => _Pantalla1State();
}

class _Pantalla1State extends State<Pantalla1> {

  final TextEditingController textoo = TextEditingController();

  String name_papu = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Pantalla de inicio"),
        ),

        body: Padding(
          padding: const EdgeInsets.all(50),
          child: (
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/7.png",
                  height: 120,
                ),

              SizedBox(height: 24,),
              TextField(
                controller: textoo,
                decoration: InputDecoration(
                  hintText: "Escribe tu nombre aqui: ",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                ),
              ),

              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  if (textoo.text.isEmpty){
                    setState(() {
                      name_papu = "Por favor ingrese su nombre";
                    });
                  } else {

                    setState(() {
                      name_papu = textoo.text;
                    });
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => ProfileScreen(name: name_papu))).then((value){
                      textoo.clear();
                    });
                  }
                },

                child: const Text("Enviar nombre",
                style: TextStyle(fontSize: 16)),
              )
              ],
            )
          ),
        ),
    );
  }
}