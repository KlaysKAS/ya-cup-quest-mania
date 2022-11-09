import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ya_cup_quest_mania/models/quest_step.dart';

class ImageWithDescription {
  String description;
  Image img;

  ImageWithDescription({required this.description, required this.img});
}

class Slide {
  List<ImageWithDescription>? imgText;
  String? text;
  Image? img;

  Slide({this.img, this.text, this.imgText}) : assert(imgText != null || text != null || img != null);

  static Slide fromMemoryImage(Uint8List img) => Slide(img: Image.memory(img));
}

class Slides extends QuestStep {
  List<Slide> slides;

  Slides({required this.slides, required super.id, required super.nextStepId}) : super(type: StepType.slide());
}
