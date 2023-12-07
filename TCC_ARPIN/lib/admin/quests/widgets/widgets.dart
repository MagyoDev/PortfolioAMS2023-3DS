import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class Questionary {
  final BuildContext context;

  Questionary({required this.context});

  List<Widget> editQuestionaryList(
      {required double fem, required double ffem, required List questData}) {
    List<Widget> list = [];

    // ignore: unused_local_variable
    for (int i = 0; i < questData.length; i++) {
      list.add(editQuestTile(
          fem: fem, ffem: ffem, questData: questData));
    }
    return list;
  }

  Widget editQuestTile(
      {required double fem,
      required double ffem,
      required List questData,
      }) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          TextEditingController _textPerguntaController =
              TextEditingController();
          return SingleChildScrollView(
            child: ListView(
              children: [
                TextField(
                  controller: _textPerguntaController.value =
                      questData[0]["textPergunta"],
                  maxLines: 1,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding:
                        EdgeInsets.fromLTRB(25 * fem, 0 * fem, 0 * fem, 0 * fem),
                    hintText: 'Pergunta da questão',
                    hintStyle: const TextStyle(color: Color(0xff000000)),
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 48 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.5 * ffem / fem,
                    color: const Color(0xff000000),
                  ),
                ),
                TextField(
                  controller: _textPerguntaController.value =
                      questData[0]["textPergunta"],
                  maxLines: 1,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding:
                        EdgeInsets.fromLTRB(25 * fem, 0 * fem, 0 * fem, 0 * fem),
                    hintText: 'Pergunta da questão',
                    hintStyle: const TextStyle(color: Color(0xff000000)),
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 48 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.5 * ffem / fem,
                    color: const Color(0xff000000),
                  ),
                )
                
                ]
            ),
          );
        });

        return Container();
  }

  // Widget editQuestTiles(
  //     {required double fem,
  //     required double ffem,
  //     required List questData,
  //     required int idQdata}) {
  //   return StickyHeader(
  //     header: Container(
  //       //SUBTITULO
  //       padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 130 * fem, 0 * fem),
  //       color: const Color(0xffffffff),
  //       height: 220 * fem,
  //       width: MediaQuery.of(context).size.width,
  //       margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 25 * fem),
  //       child: Center(
  //         child: Text(
  //           questData[idQdata]['textPergunta'],
  //           textAlign: TextAlign.center,
  //           style: GoogleFonts.poppins(
  //             fontSize: 64 * ffem,
  //             fontWeight: FontWeight.w400,
  //             height: 1.5 * ffem / fem,
  //             color: const Color(0xff000000),
  //           ),
  //         ),
  //       ),
  //     ),
  //     content: Column(
  //       children: [
  //         Container(
  //           margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 50 * fem),
  //           width: MediaQuery.of(context).size.width - 200 * fem,
  //           child: TextField(
  //             questData[idQdata]['opcao1'],
  //             textAlign: TextAlign.justify,
  //             style: GoogleFonts.poppins(
  //               fontSize: 56 * ffem,
  //               fontWeight: FontWeight.w300,
  //               height: 1.5 * ffem / fem,
  //               color: const Color(0xff000000),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
