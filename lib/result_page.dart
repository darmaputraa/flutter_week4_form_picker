import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String imagePick, birthDate, about;
  Color? colorFav;

  ResultPage(
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
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Birth: $birthDate'),
          ),
          ListTile(
            title: Text(
              "$about'",
              textAlign: TextAlign.center,
            ),
          ),
          CircleAvatar(backgroundColor: colorFav)
        ],
      ),
    );
  }
}
