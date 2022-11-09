import 'package:flutter/material.dart';
import 'package:ya_cup_quest_mania/create_quest_page/new_slide.dart';

class StepType {
  String label;
  String name;
  Type createPage;

  StepType({required this.label, required this.name, required this.createPage});

  static final _slide = StepType(
    label: 'Слайды',
    name: 'slide',
    createPage: NewSlidePage,
  );
  static final _singleAnswerQuestion = StepType(
    label: 'Открытый вопрос',
    name: 'singleAnswerQuestion',
    createPage: NewSlidePage,
  );
  static final _multiplyAnswerQuestion = StepType(
    label: 'Вопрос с выбором',
    name: 'multiplyAnswerQuestion',
    createPage: NewSlidePage,
  );
  static final _geolocation = StepType(
    label: 'Метка геолокации',
    name: 'geolocation',
    createPage: NewSlidePage,
  );

  static StepType slide() => _slide;

  static StepType singleAnswerQuestion() => _singleAnswerQuestion;

  static StepType multiplyAnswerQuestion() => _multiplyAnswerQuestion;

  static StepType geolocation() => _geolocation;

  static List<StepType> values() => [_slide, _singleAnswerQuestion, _multiplyAnswerQuestion, _geolocation];
}

abstract class QuestStep {
  final StepType type;
  final int id;
  final int? nextStepId;

  QuestStep({required this.id, required this.type, this.nextStepId});
}
