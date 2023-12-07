import 'package:ar_pin/auth/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../home_page.dart';
import '../../user_profile.dart';
import '../../quest_conclude.dart';
import 'models/question_model.dart';

class Quest extends StatefulWidget {
  final String idQuest;
  const Quest({super.key, required this.idQuest});

  @override
  State<Quest> createState() => _QuestState();
}

class _QuestState extends State<Quest> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool correct = false;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UserProfile()));
              },
              icon: Image.asset('assets/images/user.png')),
        ],
        title: IconButton(
            iconSize: 40,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: Image.asset('assets/images/led.png')),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('assets/images/arrow.png')),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double baseWidth = 1040;
          double fem = constraints.maxWidth / baseWidth;
          double ffem = fem * 0.97;

          // List<Question> questionList = getQuestionList(snapshot);
          return FutureBuilder(
              future: getQuestions(idQuest: widget.idQuest),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent),
                  );
                }

                List<Question> questionList = snapshot.data as List<Question>;

                return SizedBox(
                  width: double.infinity,
                  child: Container(
                    // questionarioWqM (296:102)
                    padding:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                    width: double.infinity,
                    child: Column(
                      children: [
                        _questionWidget(fem, ffem, questionList),
                        _answerList(fem, ffem, questionList),
                        _nextButton(fem, ffem, questionList),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  _questionWidget(double fem, double ffem, List<Question> questionList) {
    return Column(
      children: [
        Center(
          child: Container(
            // questionarioBTd (296:116)
            margin: EdgeInsets.fromLTRB(0 * fem, 75 * fem, 0 * fem, 25 * fem),
            child: Text(
              'Questionario',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 70 * ffem,
                fontWeight: FontWeight.w700,
                height: 1.5 * ffem / fem,
                fontStyle: FontStyle.italic,
                color: const Color(0xff000000),
              ),
            ),
          ),
        ),
        Text(
          "Questão ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: GoogleFonts.poppins(
            fontSize: 48 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.5 * ffem / fem,
            color: const Color(0xff000000),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 150 * fem),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
            color: Color(0xffDAD1E4),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                questionList[currentQuestionIndex].questionText,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5 * ffem / fem,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }

  _answerList(double fem, double ffem, List<Question> questionList) {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e, fem, ffem, correct, questionList),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer, double fem, double ffem, bool correct,
      List<Question> questionList) {
    bool isSelected = answer == selectedAnswer;

    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 75 * fem),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: isSelected ? Colors.white : Colors.black,
            backgroundColor:
                isSelected ? const Color(0xffe51f43) : const Color(0xffDAD1E4),
            minimumSize: Size(920 * fem, 125 * fem),
            maximumSize: Size(920 * fem, 125 * fem),
            elevation: 3,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
          onPressed: () {
            if (answer.isCorrect) {
              alterarEstadoVariavel();
            }
            setState(() {
              selectedAnswer = answer;
            });
          },
          child: Center(
            child: Text(
              answer.answerText,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  void alterarEstadoVariavel() {
    setState(() {
      correct = true;
      print('alterarEstadoVariavel: correct=  $correct');
    });
  }

  _nextButton(double fem, double ffem, List<Question> questionList) {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 150 * fem,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xffe51f43),
            ),
            onPressed: () {
              print('_nextButton: correct=  $correct');

              if (correct == true) {
                score++;
                correct = false;
                print('_nextButton IF: correct=  $correct');
              }
              if (isLastQuestion) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestConcluido(
                              idQuest: widget.idQuest,
                              score: score,
                              question: currentQuestionIndex,
                            )));
              } else {
                //next question
                setState(() {
                  selectedAnswer = null;
                  currentQuestionIndex++;
                });
              }
            },
            child: Text(
              isLastQuestion ? "Concluir" : "Proximo",
              style: GoogleFonts.poppins(
                fontSize: 40 * ffem,
                fontWeight: FontWeight.w600,
                height: 1.5 * ffem / fem,
                color: const Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
