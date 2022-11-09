import 'package:flutter/material.dart';
import 'package:ya_cup_quest_mania/create_quest_page/create_quest_page.dart';
import 'package:ya_cup_quest_mania/models/quest_step.dart';

class CreateQuestPageVm extends ChangeNotifier {
  String questName = "";
  CreateStage _stage = CreateStage.nameSet;
  final List<QuestStep> _steps = [];
  StepType? _curType;
  final List<StepType> allTypes = StepType.values();

  StepType get curType => _curType!;

  set curType(StepType value) {
    _curType = value;
    _stage = CreateStage.createStep;
    notifyListeners();
  }

  CreateStage get stage => _stage;

  void applyName() {
    _stage = CreateStage.chooseType;
    notifyListeners();
  }

  void nextSlide() {}

  void prevSlide() {}

  void save() {}
}
