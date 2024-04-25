import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

// ignore: must_be_immutable
class RecognizerPage extends StatefulWidget {
  RecognizerPage({super.key, required this.image});
  File image;
  @override
  State<RecognizerPage> createState() => _RecognizerPageState();
}

class _RecognizerPageState extends State<RecognizerPage> {
  late TextRecognizer textRecognizer;
  @override
  void initState() {
    super.initState();
    textRecognizer = TextRecognizer(
        script: TextRecognitionScript.latin); // chooese text type
    makeTextRecognition();
  }

  String result = "";
  makeTextRecognition() async {
    InputImage inputImage = InputImage.fromFile(widget!.image);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    result = recognizedText.text;
    print(result);
    setState(() {
      result;
    });
    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final List<Point<int>> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 221, 144, 170),
        title: const Text('Recognizer'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Colors.grey,
                height: 500,
                width: double.infinity,
                //gelen resim burada dosya olarak gösterilir
                child: Image.file(
                  widget.image,
                )),
            Text(result)
          ],
        ),
      ),
    );
  }
}
