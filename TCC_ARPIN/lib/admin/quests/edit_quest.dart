import 'package:ar_pin/auth/services/database.dart';
import 'package:ar_pin/utils/appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class EditQuest extends StatefulWidget {
  final String idQuest;
  final bool isStart;
  final int? index;
  const EditQuest({super.key, required this.idQuest, required this.isStart, this.index});

  @override
  State<EditQuest> createState() => _EditQuestState();
}

class _EditQuestState extends State<EditQuest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ArpinAppBar().title(context),
        actions: ArpinAppBar().actions(context),
        leading: ArpinAppBar().leading(context),
        centerTitle: ArpinAppBar().centerTitle,
        backgroundColor: ArpinAppBar().backgroundColor,
        elevation: ArpinAppBar().elevation,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("questionarios")
              .doc(widget.idQuest)
              .collection("perguntas")
              .get(),
          builder: (context, snapshot) {
            
            if (snapshot.hasData) {
              if (widget.isStart == true) {
                List optionList = snapshot.data!.docs.toList();

                List<int> idList = [];

                for (int i = 0; i < optionList.length; i++) {
                  idList.add(optionList[i]["id"]);
                }

                idList.sort();
                int index = 0;
                final int counter = idList.last;
                return EditableQuestTile(
                      idQuest: widget.idQuest,
                      index: index,
                      questList: optionList,
                      questionaryLength: counter,
                    );
                  
              }if(widget.isStart == false){
                List optionList = snapshot.data!.docs.toList();

                List<int> idList = [];

                for (int i = 0; i < optionList.length; i++) {
                  idList.add(optionList[i]["id"]);
                }

                idList.sort();
                int index = widget.index!;
                final int counter = idList.last;
                return EditableQuestTile(
                      idQuest: widget.idQuest,
                      index: index,
                      questList: optionList,
                      questionaryLength: counter,
                    );
              }
              return Container();
            }
            return const Center(
                child: CircularProgressIndicator(),
              );
          },
        );
      }),
    );
  }
}
