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
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 100,
                margin: const EdgeInsets.only(top: 20, left: 13, right: 13),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 197, 125, 149),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.scanner,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.document_scanner,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.change_circle,
                        )),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 300,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
              ),
              Container(
                //Bottom camera and image button widget
                height: 100,
                margin: const EdgeInsets.only(bottom: 20, left: 13, right: 13),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 197, 125, 149),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.refresh,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera,
                          size: 50,
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
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
