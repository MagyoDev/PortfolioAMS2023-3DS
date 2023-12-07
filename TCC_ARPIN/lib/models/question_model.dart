import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);

  Map<String, dynamic> toMap(){
    return {
      'textPergunta': questionText,
      'respostas': answersList.map((e) => e.toMap()).toList(),
    };
  }

  factory Question.fromMap(Map<String, dynamic> map){
    return Question(
      map['textPergunta'],
      <Answer>[
        Answer (map['opcao1'][0], map['opcao1'][1]),
        Answer (map['opcao2'][0], map['opcao2'][1]),
        Answer (map['opcao3'][0], map['opcao3'][1]),
        Answer (map['opcao4'][0], map['opcao4'][1]),
      ]
      
      // List<Answer>.from(map['respostas'].map((a) => Answer.fromMap(a))
    );}
}
class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);

  Map<String, dynamic> toMap(){
    return {
      'textResposta': answerText,
      'isCorreta': isCorrect,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map){
    return Answer(
      map['textResposta'],
      map['isCorreta'],
    );
  }
}

class Questions{
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Question>> getQuestions(){
    return _db.collection('questionarios').doc("led").collection("perguntas").snapshots().map((snapshot) => snapshot.docs.map((doc) => Question.fromMap(doc.data())).toList());
  } 

  Future<void> addQuestion(Question question) async {
    await _db.collection('questions').add(question.toMap());
  }

  Future<void> removeQuestion(Question question) async {
    final snapshot = await _db
        .collection('questions')
        .where('questionText', isEqualTo: question.questionText)
        .get();
    snapshot.docs.first.reference.delete();
  }

  Future<void> updateQuestion(Question oldQuestion, Question newQuestion) async {
    final snapshot = await _db
        .collection('questions')
        .where('questionText', isEqualTo: oldQuestion.questionText)
        .get();
    snapshot.docs.first.reference.update(newQuestion.toMap());
  }

  Future<void> clearQuestions() async {
    final snapshot = await _db.collection('questions').get();
    for (DocumentSnapshot doc in snapshot.docs) {
      doc.reference.delete();
    }
  }
  

}

Future getAllQuestions() async{
  await FirebaseFirestore.instance.collection("questionair");
}

List<Question> getQuestionList(AsyncSnapshot snapshot){
  if(snapshot.hasData){
    List<Question> list = [];

    for (var result in snapshot.data.docs) {
      Map<String, dynamic> map = result.data();
      list.add(Question(map['textPergunta'], [
        Answer(map['opcao1'][0], map['opcao1'][1]),
        Answer(map['opcao2'][0], map['opcao2'][1]),
        Answer(map['opcao3'][0], map['opcao3'][1]),
        Answer(map['opcao4'][0], map['opcao4'][1]),
      ]
      ));
    }
    return list;
  }
  else{
    return [];
  }
}

Future <List<Question>> getQuestions({ required String idQuest}) async{
  List<Question> list = [];
  //ADD questions and answer here
  await FirebaseFirestore.instance.collection('questionarios').doc(idQuest).collection("perguntas").get().then((querySnapshot) {
    for (var result in querySnapshot.docs) {
      list.add(Question.fromMap(result.data()));
    }
    
  });
  return list;

  // list.add(Question(
  //   "Qual é a função principal de um LED?",
  //   [
  //     Answer("Gerar calor", false),
  //     Answer("Emitir luz", true),
  //     Answer("Produzir som", false),
  //     Answer("Armazenar energia", false),
  //   ],
  // ));

  // list.add(Question(
  //   "Qual é uma das principais vantagens dos LEDs em comparação com as lâmpadas incandescentes tradicionais?",
  //   [
  //     Answer("Maior consumo de energia", false),
  //     Answer("Emissão de calor", false),
  //     Answer("Luz amarela", false),
  //     Answer("Maior vida útil", true),
  //   ],
  // ));

  // list.add(Question(
  //   "Qual é a principal aplicação dos LEDs RGB (Red, Green, Blue) em eletrônicos e iluminação?",
  //   [
  //     Answer("Reprodução de cores", true),
  //     Answer("Indicação de temperatura ambiente", false),
  //     Answer("Produção de ruído", false),
  //     Answer("Resfriamento de dispositivos", false),
  //   ],
  // ));

  // list.add(Question(
  //   "O que acontece quando uma corrente elétrica é aplicada a um LED?",
  //   [
  //     Answer("Ele esquenta", false),
  //     Answer("Ele fica inerte", false),
  //     Answer("Ele emite luz", true),
  //     Answer("Ele se desintegra", false),
  //   ],
  // ));

  // return list;
}
