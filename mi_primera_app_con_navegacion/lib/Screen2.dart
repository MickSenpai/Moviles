import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      theme: ThemeData(scaffoldBackgroundColor: Color.fromRGBO(255, 178, 228, 1)),
      home: ProfileScreen(name: '',),
    );
  }
}

class ProfileScreen extends StatelessWidget {
final String name;

  const ProfileScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile")
        ),

      body: Center(
        child: Column(
          children: [
            Image.asset(
                  "assets/images/7.png",
                  height: 120,
                ),

            Text("Bienvenido: $name",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text("Go back nigga"),
            ),
          ],
        )
      ),
    );
  }
}