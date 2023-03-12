import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String birthDate, about;
  final Color? colorFav;
  final Image? imagePick;

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
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: imagePick,
                    ),
                    SizedBox(
                        height: 200,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(imagePick.toString(),
                                textAlign: TextAlign.justify),
                          ],
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ListTile(
                title: Text('Birth: $birthDate',
                    style: const TextStyle(fontSize: 20, color: Colors.grey)),
                trailing: Wrap(
                  children: [
                    const Text(
                      'Color:',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    SizedBox(
                        height: 20,
                        child:
                            CircleAvatar(backgroundColor: colorFav, radius: 8))
                  ],
                )),
            ListTile(
              title: Text(
                "$about'",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
