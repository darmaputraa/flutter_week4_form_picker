import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_week4_form_picker/result_page.dart';
import 'package:open_file/open_file.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  String pathText = 'Path....';
  TextEditingController dateCtl = TextEditingController();
  TextEditingController captionText = TextEditingController();

  dynamic fileResult;

  Future _pickFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    // final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      fileResult = File(result.files.single.path ?? '');
      debugPrint("FILE_RESULT : ${fileResult?.path}");

      setState(() {});
      _openFile(result.files.first);
    } else {}
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2028));
    if (date != null && date != selectedDate) {
      setState(() {
        selectedDate = date;
        dateCtl.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  Color currentColor = Colors.transparent;

  void _selectColor(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Choose Color'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              )
            ],
            content: SingleChildScrollView(
              child: BlockPicker(
                pickerColor: currentColor,
                onColorChanged: (color) {
                  setState(() => currentColor = color);
                },
              ),
            ),
          );
        });
  }

  void changeColor(Color color) {
    setState(() => currentColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("Create Form Biodata"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pick Files',
                style: TextStyle(fontWeight: FontWeight.bold)),
            pickField(),
            const SizedBox(height: 12),
            const Text('Birth', style: TextStyle(fontWeight: FontWeight.bold)),
            dateField(),
            const SizedBox(height: 12),
            const Text('Favorit Color',
                style: TextStyle(fontWeight: FontWeight.bold)),
            colorField(),
            const SizedBox(height: 12),
            const Text('About', style: TextStyle(fontWeight: FontWeight.bold)),
            aboutField(),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  imagePick: Image.file(fileResult),
                                  birthDate: dateCtl.text,
                                  colorFav: currentColor,
                                  about: captionText.text,
                                ))),
                    child: const Text("Save")),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget pickField() {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
          child: Text('Pick Files $fileResult'),
          onPressed: () {
            _pickFile();
          },
        ))
      ],
    );
  }

  Widget dateField() {
    return TextFormField(
      readOnly: true,
      textAlign: TextAlign.start,
      controller: dateCtl,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          hintText: "dd-MM-yyyy"),
      onTap: () {
        _selectDate(context);
      },
    );
  }

  Widget colorField() {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
          filled: true,
          fillColor: currentColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          hintText: ("Choose Color")),
      onTap: () {
        _selectColor(context);
      },
    );
  }

  Widget aboutField() {
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
