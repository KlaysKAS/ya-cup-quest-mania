import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class NewSlidePage extends StatefulWidget {
  const NewSlidePage({Key? key}) : super(key: key);

  @override
  State<NewSlidePage> createState() => _NewSlidePageState();
}

class _NewSlidePageState extends State<NewSlidePage> {
  double _currentSliderValue = 0;

  late TextEditingController _singleTextController =
      TextEditingController(text: _singleText == "" ? null : _singleText);
  String _singleText = "";

  Image? _singleImage;

  List<String> _multiStr = [];
  List<Image?> _multiImages = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_getLabel()),
        const SizedBox(height: 10),
        Slider(
          value: _currentSliderValue,
          max: 2,
          divisions: 2,
          label: _getLabel(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
              _singleTextController = TextEditingController(text: _singleText == "" ? null : _singleText);
            });
          },
        ),
        const SizedBox(height: 10),
        _content(),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _newTextSlide() {
    return TextField(
      maxLines: 10,
      controller: _singleTextController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Текст',
      ),
      onChanged: (newText) => setState(() {
        _singleText = newText;
      }),
    );
  }

  Widget _newImageSlide() {
    return Stack(
      children: [
        if (_singleImage != null)
          Center(
            child: _singleImage,
          ),
        if (_singleImage != null)
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () => setState(() {
                _singleImage = null;
              }),
              child: const Text(
                "X",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        if (_singleImage == null)
          Center(
            child: ElevatedButton(
              onPressed: _pickImage,
              child: const Text(
                "Выбрать изображение",
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
      ],
    );
  }

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      final imgFile = File(result.files.single.path!);
      _singleImage = Image.memory(
        imgFile.readAsBytesSync(),
        fit: BoxFit.contain,
      );
      setState(() {});
    }
  }

  Widget _newPairSlide() {
    return Flexible(child: ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        if (index == _multiImages.length) {
          return ElevatedButton(onPressed: () => setState(() {
            _multiImages.add(null);
            _multiStr.add("");
          }), child: const Text("Ещё"),);
        } else {
          return Text("Типа карточка");
        }
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 5),
      itemCount: _multiImages.length + 1,
    ),);
  }

  Widget _content() {
    switch (_currentSliderValue.round()) {
      case 0:
        return _newTextSlide();
      case 1:
        return _newImageSlide();
      case 2:
        return _newPairSlide();
    }
    return Container();
  }

  String _getLabel() {
    switch (_currentSliderValue.round()) {
      case 0:
        return "Текст";
      case 1:
        return "Изображение";
      case 2:
        return "Изображения с описаниями";
    }
    return "";
  }
}
