import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_one/quiz_app/quiz_model.dart';
import 'package:http/http.dart' as http;

class QuizHome extends StatefulWidget {
  const QuizHome({Key? key}) : super(key: key);

  @override
  State<QuizHome> createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  QuizModel? quizModel;
  List<int> numbers = List<int>.generate(10, (i) => i + 1);
  bool isStart = false;
  List<int> optionList = [];
  final random = math.Random();
  int rightCount = 0;
  bool isLoading = false;

  Future apiCall() async {
    // setState(() {
    //   isLoading = true;
    // });
    const url = 'https://marcconrad.com/uob/smile/api.php';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      quizModel = QuizModel();
      final body = jsonDecode(response.body);
      log(body.toString(), name: 'body ');
      quizModel = QuizModel.fromJson(body);
      addDataToOptions();
      // setState(() {
      //   isLoading = false;
      // });
    } else {
      // setState(() {
      //   isLoading = false;
      // });
      return;
    }
  }

  void addDataToOptions() {
    optionList.clear();
    optionList.add(quizModel?.solution ?? 0);
    while (optionList.length != 4) {
      var randomNumber = random.nextInt(numbers.length);
      if (!optionList.contains(randomNumber)) {
        optionList.add(randomNumber);
      }
    }
    optionList.shuffle();
  }

  @override
  void initState() {
    // apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('hello');
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Welcome To QUIZ'),
                ),
              ),
              const SizedBox(height: 16),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : Visibility(
                      visible: !isStart,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await apiCall();
                          isStart = true;
                          setState(() {
                            isLoading = false;
                          });
                          setState(() {});
                        },
                        child: const Text('Start'),
                      ),
                    ),
              Visibility(
                visible: isStart,
                child: Column(
                  children: [
                    const Text('Question'),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text('Total Score: ${rightCount.toString()}')),
                    const SizedBox(height: 16),
                    Image.network(quizModel?.question.toString() ?? ''),
                    const SizedBox(height: 16),
                    Wrap(
                      children: optionList
                          .map(
                            (e) => Row(
                              children: [
                                Text('${optionList.indexOf(e).toString()})'),
                                const SizedBox(width: 10),
                                TextButton(
                                  onPressed: () async {
                                    if (e == quizModel!.solution) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Congratulation your answer is correct!!'),
                                        ),
                                      );
                                      rightCount++;
                                      await apiCall().then((value) {
                                        setState(() {});
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Sorry!! your answer is incorrect'),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    e.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
