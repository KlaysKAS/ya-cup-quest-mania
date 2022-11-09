import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ya_cup_quest_mania/create_quest_page/create_quest_page_vm.dart';
import 'package:ya_cup_quest_mania/create_quest_page/new_slide.dart';

enum CreateStage {
  nameSet,
  // newStep,
  chooseType,
  createStep,
}

class CreateQuestPage extends StatelessWidget {
  const CreateQuestPage({Key? key}) : super(key: key);
  final _buttonTextStyle = const TextStyle(
    fontSize: 10,
  );

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CreateQuestPageVm>();
    return Scaffold(
      appBar: AppBar(
        title: Text(vm.questName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            _tabPanel(vm),
            const SizedBox(height: 10),
            Flexible(
              child: _content(vm),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabPanel(CreateQuestPageVm vm) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: vm.prevSlide,
          child: Text(
            "Назад",
            style: _buttonTextStyle,
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: vm.save,
          child: Text(
            "Завершить",
            style: _buttonTextStyle,
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: vm.nextSlide,
          child: Text(
            "Следующий",
            style: _buttonTextStyle,
          ),
        ),
      ],
    );
  }

  Widget _content(CreateQuestPageVm vm) {
    switch (vm.stage) {
      case CreateStage.nameSet:
        return _nameSet(vm);
      case CreateStage.chooseType:
        return _chooseTypeMenu(vm);
      case CreateStage.createStep:
        return _createStep(vm);
    }
  }

  Widget _createStep(CreateQuestPageVm vm) {
    switch (vm.curType.createPage) {
      case NewSlidePage:
        return const NewSlidePage();
    }
    return Container();
  }

  Widget _chooseTypeMenu(CreateQuestPageVm vm) {
    return Center(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => ElevatedButton(
          onPressed: () => vm.curType = vm.allTypes[index],
          child: Text(
            vm.allTypes[index].label,
            style: _buttonTextStyle,
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
        itemCount: vm.allTypes.length,
      ),
    );
  }

  Widget _nameSet(CreateQuestPageVm vm) {
    return Center(
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Имя шага',
              ),
              onChanged: (newName) => vm.questName = newName,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: vm.applyName,
            child: Text(
              "Подтвердить",
              style: _buttonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
