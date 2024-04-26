import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_scanner_example/recognize_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ImagePicker imagePicker;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.blue,
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              //Bottom camera and image button widget
              height: 100,
              margin: const EdgeInsets.only(
                bottom: 1,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.document_scanner,
                        size: 30,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () async {
                        XFile? xfile = await imagePicker.pickImage(
                            source: ImageSource.camera); //gallerry to image
                        if (xfile != null) {
                          File image = File(xfile.path); //iamge path
                          // ignore: use_build_context_synchronously
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RecognizerPage(
                                image: image); //sent image to recognizerpage
                          }));
                        }
                      },
                      icon: const Icon(
                        Icons.camera,
                        size: 50,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () async {
                        XFile? xfile = await imagePicker.pickImage(
                            source: ImageSource.gallery); //gallerry to image
                        if (xfile != null) {
                          File image = File(xfile.path); //iamge path
                          // ignore: use_build_context_synchronously
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RecognizerPage(
                                image: image); //sent image to recognizerpage
                          }));
                        }
                      },
                      icon: const Icon(
                        Icons.image,
                        size: 30,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
