import 'package:flutter/material.dart';
import 'package:flutter_week4_form_picker/result_page.dart';

final TextEditingController dateCtl = TextEditingController();
final TextEditingController captionText = TextEditingController();

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute<Color>(
            builder: (_) => ResultPage(
                  imagePick: '',
                  birthDate: dateCtl.text,
                  colorFav: '',
                  about: captionText.text,
                ))),
        child: const Text("Save"));
  }
}