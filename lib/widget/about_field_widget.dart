import 'package:flutter/material.dart';

class AboutFieldWidget extends StatelessWidget {
  final TextEditingController captionText = TextEditingController();
  AboutFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: captionText,
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.start,
      maxLines: 5,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
    );
  }
}
