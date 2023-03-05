import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String imagePick, birthDate, colorFav, about;

  const ResultPage(
      {Key? key,
      required this.imagePick,
      required this.birthDate,
      required this.colorFav,
      required this.about})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("Result"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Birth: $birthDate"),
          Text("About $about"),
        ],
      ),
    );
  }
}
