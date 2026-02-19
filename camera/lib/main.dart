import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gal/gal.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Sensor',
      home: CameraScreen()
    );
  }
}

class CameraScreen extends StatefulWidget {
  CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if(photo != null){
      final File imageFile = File(photo.path);
      //Guardar en galeria

      final result = await Gal.putImage(imageFile.path);

      setState(() {
        _image = imageFile;
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Imagen Guardada en la Galeria")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
       title: const Text("Practica de camara"), 
      ),
      body: Center(
        child: _image == null ? const Text("No hay Imagen seleccionada, papu") : Image.file(_image!),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _takePhoto,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}