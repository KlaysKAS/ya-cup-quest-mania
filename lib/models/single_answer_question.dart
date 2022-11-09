import 'package:ya_cup_quest_mania/models/quest_step.dart';

class SingleAnswerQuestion extends QuestStep {
  final String answer;
  final String question;

  SingleAnswerQuestion({
    required this.question,
    required this.answer,
    required super.id,
    required super.nextStepId,
  }) : super(type: StepType.singleAnswerQuestion());
}
