import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ya_cup_quest_mania/create_quest_page/create_quest_page.dart';
import 'package:ya_cup_quest_mania/create_quest_page/create_quest_page_vm.dart';
import 'package:ya_cup_quest_mania/pass_quest_page/create_quest_page.dart';
import 'package:ya_cup_quest_mania/pass_quest_page/create_quest_page_vm.dart';

const String _title = 'Квестомания';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: _title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _buttonTextStyle = const TextStyle(
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _createQuest(),
            const SizedBox(height: 20),
            _passQuest(),
          ],
        ),
      ),
    );
  }

  Widget _createQuest() {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider.value(
                value: CreateQuestPageVm(),
              ),
            ],
            child: const CreateQuestPage(),
          ),
        ),
      ),
      child: Text(
        'Создать новый квест',
        style: _buttonTextStyle,
      ),
    );
  }

  Widget _passQuest() {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: PassQuestPageVm()),
            ],
            child: const PassQuestPage(),
          ),
        ),
      ),
      child: Text(
        'Пройти уже созданный квест',
        style: _buttonTextStyle,
      ),
    );
  }
}
