import 'package:ar_pin/admin/quests/edit_quest.dart';
import 'package:ar_pin/home_page.dart';
import 'package:ar_pin/utils/appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sticky_headers/sticky_headers.dart';

class AdminQuestionarioPage extends StatefulWidget {
  const AdminQuestionarioPage({super.key});

  @override
  State<AdminQuestionarioPage> createState() => _AdminQuestionarioPageState();
}

class _AdminQuestionarioPageState extends State<AdminQuestionarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: ArpinAppBar().elevation,
          backgroundColor: Colors.white,
          actions: ArpinAppBar().actions(context),
          title: ArpinAppBar().title(context),
          centerTitle: ArpinAppBar().centerTitle,
          leading: ArpinAppBar().leading(context),
        ),
        body: FutureBuilder(
            future:
                FirebaseFirestore.instance.collection("questionarios").get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              List questionarios = snapshot.data!.docs.toList();

              return ScrollablePositionedList.builder(
                itemCount: questionarios.length,
                initialScrollIndex: 0,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                              child: Text(
                                questionarios[index]["id"].toString().toUpperCase(),
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xffe51f43)
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <IconButton>[
                            IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditQuest(
                                              isStart: true,
                                              idQuest: questionarios[index]
                                                      ["id"]
                                                  .toString())));
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete)),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }));
  }
}

String parseOptionValueToString(dynamic valorOpcao) {
  String valor = valorOpcao.toString();
  return valor;
}

Color saveBoolButtonColor(Object? opcaoBool) {
  final saveBool = opcaoBool as bool;
  if (saveBool == true) {
    return Colors.green;
  } else {
    return const Color(0xffe51f43);
  }
}
