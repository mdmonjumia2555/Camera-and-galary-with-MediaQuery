import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  return runApp(app());
}

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? image, img;
  Galary() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedImage!.path);
    });
  }

  PickImage() async {
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      image = File(pickedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              color: Colors.lightGreenAccent,
              child: image == null
                  ? Center(child: Text('Please Select Your Image'))
                  : Image.file(image!),
            ),
            Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    PickImage();
                  },
                  label: const Text('Camera'),
                  icon: const Icon(Icons.photo_camera),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Galary();
                  },
                  label: const Text('Galary'),
                  icon: const Icon(Icons.collections),
                ),
              ],
            )
          ],
        ),
        /*Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  PickImage();
                },
                child: Text('Upload Image'),
              ),
              image == null
                  ? Text('Please Select Your Image')
                  : Image.file(image!),
            ],
          ),
        ),*/
      ),
    );
  }
}
