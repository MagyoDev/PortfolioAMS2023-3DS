import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../../home_page.dart';
import 'quest.dart';
import '../../user_profile.dart';

class MaterialDidatico extends StatefulWidget {
  final String idMaterialDidatico;
  final String idQuest;
  const MaterialDidatico(
      {super.key, required this.idQuest, required this.idMaterialDidatico});

  @override
  State<MaterialDidatico> createState() => _MaterialDidaticoState();
}

class _MaterialDidaticoState extends State<MaterialDidatico> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
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
          int idMDdata = -1;

          return FutureBuilder(
              future: firestore
                  .collection('tutoriais')
                  .doc("material-didatico")
                  .collection(widget.idMaterialDidatico)
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent),
                  );
                }

                final materialDidaticoData = snapshot.data!.docs.toList();

                return SizedBox(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 0 * fem),
                        decoration: const BoxDecoration(
                          color: Color(0xffffffff),
                        ),
                        child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  //TITULO
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 25 * fem, 0 * fem, 25 * fem),
                                  child: Text(
                                    widget.idMaterialDidatico.toUpperCase(),
                                    //id do material didatico
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 112 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5 * ffem / fem,
                                      fontStyle: FontStyle.italic,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ),
                                
                                SizedBox(
                                  child: Column(
                                    children: materialDidaticoList(
                                        fem: fem,
                                        ffem: ffem,
                                        materialDidaticoData:
                                            materialDidaticoData),
                                  ),
                                ),
                                // ListView.builder(itemCount: materialDidaticoData.length ,itemBuilder: (context, index){
                                //   return materialDidaticoTile(fem: fem, ffem: ffem, materialDidaticoData: materialDidaticoData, idMDdata: index);
                                // }),
                                SizedBox(
                                  child: Column(
                                    children: [
                                      Container(
                                        //QUEST BUTTON
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            35 * fem, 0 * fem, 50 * fem),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xffe51f43),
                                            minimumSize:
                                                Size(919 * fem, 125 * fem),
                                            elevation: 0,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50))),
                                          ),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Quest(
                                                          idQuest:
                                                              widget.idQuest,
                                                          //id do questionario
                                                        )));
                                          },
                                          child: Text(
                                            'Proximo',
                                            style: GoogleFonts.poppins(
                                              fontSize: 48 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5 * ffem / fem,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }

  List<Widget> materialDidaticoList(
      {required double fem,
      required double ffem,
      required List materialDidaticoData}) {
    List<Widget> list = [];

    // ignore: unused_local_variable
    for (int i = 0; i < materialDidaticoData.length; i++) {
      list.add(materialDidaticoTile(
          fem: fem,
          ffem: ffem,
          materialDidaticoData: materialDidaticoData,
          idMDdata: i));
    }
    return list;
  }

  Widget materialDidaticoTile(
      {required double fem,
      required double ffem,
      required List materialDidaticoData,
      required int idMDdata}) {
    return StickyHeader(
      header: Container(
        //SUBTITULO
        padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 130 * fem, 0 * fem),
        color: const Color(0xffffffff),
        height: 220 * fem,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 25 * fem),
        child: Center(
          child: Text(
            materialDidaticoData[idMDdata]['titulo'],
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 64 * ffem,
              fontWeight: FontWeight.w400,
              height: 1.5 * ffem / fem,
              color: const Color(0xff000000),
            ),
          ),
        ),
      ),
      content: Container(
        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 50 * fem),
        width: 900 * fem,
        child: Text(
          materialDidaticoData[idMDdata]['texto'],
          textAlign: TextAlign.justify,
          style: GoogleFonts.poppins(
            fontSize: 56 * ffem,
            fontWeight: FontWeight.w300,
            height: 1.5 * ffem / fem,
            color: const Color(0xff000000),
          ),
        ),
      ),
    );
  }
}
