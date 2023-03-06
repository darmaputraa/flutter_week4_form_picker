import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  String imagePick, birthDate, colorFav, about;

  ResultPage(
      {Key? key,
      required this.imagePick,
      required this.birthDate,
      required this.colorFav,
      required this.about})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
          Text('Birth: ${widget.birthDate}'),
          Text('About: ${widget.about}'),
        ],
      ),
    );
  }
}
