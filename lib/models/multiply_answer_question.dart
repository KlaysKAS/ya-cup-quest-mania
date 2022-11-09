import 'package:ya_cup_quest_mania/models/quest_step.dart';

class MultiplyAnswerQuestion extends QuestStep {
  final List<String> answers;
  final Map<String, int> nextSteps;
  final String question;

  MultiplyAnswerQuestion({
    required this.nextSteps,
    required this.answers,
    required this.question,
    required super.id,
  }) : super(type: StepType.multiplyAnswerQuestion());
}
