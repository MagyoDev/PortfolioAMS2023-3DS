import 'package:ar_pin/admin/quests/edit_quest.dart';
import 'package:ar_pin/admin/quests/keep_quests.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class DatabaseService {
  Future<void> getQuestionarioData(
      Map<String, dynamic> tutorialData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("questionarios")
        .doc("led")
        .collection("perguntas")
        .get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getQuestionarios() {
    return FirebaseFirestore.instance.collection("questionarios").snapshots();
  }
}

class EditableQuestTile extends StatefulWidget {
  final int questionaryLength;
  final List questList;
  final int index;
  final String idQuest;
  const EditableQuestTile(
      {super.key, required this.questList, required this.index, required this.idQuest, required this.questionaryLength});

  @override
  State<EditableQuestTile> createState() => _EditableQuestTileState();
}

class _EditableQuestTileState extends State<EditableQuestTile> {
  TextEditingController textPergunta = TextEditingController();
  TextEditingController opcao1 = TextEditingController();
  TextEditingController opcao1b = TextEditingController();
  TextEditingController opcao2 = TextEditingController();
  TextEditingController opcao2b = TextEditingController();
  TextEditingController opcao3 = TextEditingController();
  TextEditingController opcao3b = TextEditingController();
  TextEditingController opcao4 = TextEditingController();
  TextEditingController opcao4b = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textPergunta.text = widget.questList[widget.index]["textPergunta"];
    opcao1.text = widget.questList[widget.index]["opcao1"][0];
    opcao1b.text = widget.questList[widget.index]["opcao1"][1].toString();
    opcao2.text = widget.questList[widget.index]["opcao2"][0];
    opcao2b.text = widget.questList[widget.index]["opcao2"][1].toString();
    opcao3.text = widget.questList[widget.index]["opcao3"][0];
    opcao3b.text = widget.questList[widget.index]["opcao3"][1].toString();
    opcao4.text = widget.questList[widget.index]["opcao4"][0];
    opcao4b.text = widget.questList[widget.index]["opcao4"][1].toString();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth * 0.9,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(children: [
              Row(
              
            children: [
              TextField(
              controller: textPergunta,
              decoration: const InputDecoration(
                labelText: "Pergunta",
              ),   
              ),
            ],
          ),
          Row(
            children: [
              Row(
            children: [
              TextField(
                controller: opcao1,
                decoration: const InputDecoration(
                  labelText: "1a Opção",
                ),
              ),
              TextField(
                controller: opcao1b,
                decoration: const InputDecoration(
                  labelText: "Valor booleano",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              TextField(
                controller: opcao2,
                decoration: const InputDecoration(
                  labelText: "2a Opção",
                ),
              ),
              TextField(
                controller: opcao2b,
                decoration: const InputDecoration(
                  labelText: "Valor booleano",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              TextField(
                controller: opcao3,
                decoration: const InputDecoration(
                  labelText: "3a Opção",
                ),
              ),
              TextField(
                controller: opcao3b,
                decoration: const InputDecoration(
                  labelText: "Valor booleano",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              TextField(
                controller: opcao4,
                decoration: const InputDecoration(
                  labelText: "4a Opção",
                ),
              ),
              TextField(
                controller: opcao4b,
                decoration: const InputDecoration(
                  labelText: "Valor booleano",
                ),
              ),
            ],
          )
            ],
          ),
          Row(
            children: [
              _saveQuestInQuestionario(),
            ],
          )
          ],),
        );
        
      },
    );


  }

  Widget _saveQuestInQuestionario(){
    bool opcao1bBool = opcao1b.text == "true" ? true : false;
    bool opcao2bBool = opcao2b.text == "true" ? true : false;
    bool opcao3bBool = opcao3b.text == "true" ? true : false;
    bool opcao4bBool = opcao4b.text == "true" ? true : false;

    if(widget.questionaryLength == widget.index){
      return ElevatedButton(
      onPressed: () {
        FirebaseFirestore.instance
            .collection("questionarios")
            .doc(widget.idQuest)
            .collection("perguntas")
            .doc(widget.index.toString())
            .update({
          "pergunta": textPergunta.text,
          "opcao1": [textPergunta.text, opcao1bBool],
          "opcao2": [textPergunta.text, opcao2bBool],
          "opcao3": [textPergunta.text, opcao3bBool],
          "opcao4": [textPergunta.text, opcao4bBool],
        }).then((value) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AdminQuestionarioPage()));
        });
      },
      child: const Text("Salvar"),
    );
    }

    return ElevatedButton(
      onPressed: () {
        FirebaseFirestore.instance
            .collection("questionarios")
            .doc(widget.idQuest)
            .collection("perguntas")
            .doc(widget.index.toString())
            .update({
          "pergunta": textPergunta.text,
          "opcao1": [textPergunta.text, opcao1bBool],
          "opcao2": [textPergunta.text, opcao2bBool],
          "opcao3": [textPergunta.text, opcao3bBool],
          "opcao4": [textPergunta.text, opcao4bBool],
        }).then((value) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  EditQuest(idQuest: widget.idQuest, isStart: false,)));
        });
      },
      child: const Text("Próxima questão"),
    );
  }
}
