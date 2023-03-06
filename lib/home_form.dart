import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_week4_form_picker/result_page.dart';
import 'package:open_file/open_file.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String? filePick;
  TextEditingController dateCtl = TextEditingController();
  TextEditingController captionText = TextEditingController();

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    // Hasil file dari object result
    final file = result.files.first;
    _openFile(file);
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
          children: [
            const Text('Pick Files'),
            pickField(),
            const Text('Birth'),
            dateField(),
            const Text('Favorit Color'),
            colorField(),
            const Text('About'),
            aboutField(),
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ResultPage(
                          imagePick: '',
                          birthDate: dateCtl.text,
                          colorFav: '',
                          about: captionText.text,
                        ))),
                child: const Text("Save"))
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
          child: const Text('Pick Files'),
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
      maxLines: 5,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
    );
  }
}
