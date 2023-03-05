import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

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

class _CreatePostPageState extends State<CreatePostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text('Create Form Biodata'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pick Files',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      child: const Text('Pick Files'),
                      onPressed: () {
                        _pickFile();
                      },
                    ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
