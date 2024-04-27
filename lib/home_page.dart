import 'dart:io';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_scanner_example/recognize_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _pictures = []; //documents scanner list  ""
  late ImagePicker imagePicker;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  void onPressed() async {
    //document scanner function
    try {
      List<String> pictures =
          await CunningDocumentScanner.getPictures() ?? []; //scanner is empty
      if (!mounted) return;
      setState(() {
        _pictures = pictures; //get pictures empty list _pictures send
      });
    } catch (e) {
      if (kDebugMode) {
        print('Erorr $e');
      }
    }
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
              color: const Color.fromARGB(255, 107, 178, 236),
            ),
            Expanded(
              child: Container(),
            ),
            for (var picture in _pictures) Image.file(File(picture)),
            Container(
              //Bottom camera and image button widget
              height: 100,
              margin: const EdgeInsets.only(
                bottom: 1,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 107, 178, 236),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: onPressed,
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
