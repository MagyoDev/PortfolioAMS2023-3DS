import 'package:ar_pin/baixar_modelo.dart';
import 'package:ar_pin/codigo-strings/codigo1.dart';
import 'package:ar_pin/codigo.dart';
import 'package:ar_pin/codigo_home.dart';
import 'package:ar_pin/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tutoriais/tutorial.dart';
import 'modelos_disponiveis.dart';
import 'user_profile.dart';
import 'admin/tutorial/tutorial_alter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: null,
            icon: Image.asset('assets/images/led.png')),
        centerTitle: true,
        leading: IconButton(
            onPressed: null, icon: Image.asset('assets/images/White.png')),
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double baseWidth = 1050;
          double fem = constraints.maxWidth / baseWidth;
          double ffem = fem * 0.97;

          return SingleChildScrollView(
            child: Column(children: [
              _basicos(fem, ffem),
              _componentes(fem, ffem),
              _codigo(fem, ffem),
              _button(fem, ffem),
            ]),
          );
        },
      ),
    );
  }

  _basicos(double fem, double ffem) {
    return Column(
      children: [
        //LIST VIEW 'BASICOS'
        Container(
          margin: EdgeInsets.fromLTRB(50 * fem, 100 * fem, 0 * fem, 0 * fem),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Conceitos Basicos',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 54 * ffem,
                fontWeight: FontWeight.w600,
                height: 1.5 * ffem / fem,
                fontStyle: FontStyle.italic,
                color: const Color(0xff000000),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(25 * fem, 0 * fem, 0 * fem, 0 * fem),
          height: 400 * fem,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              // SizedBox(
              //   width: 400 * fem,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: InkWell(
              //       onTap: () {},
              //       child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(50 * fem),
              //           color: const Color(0xffffffff),
              //           boxShadow: [
              //             BoxShadow(
              //               color: const Color(0x82615b69),
              //               offset: Offset(0 * fem, 7 * fem),
              //               blurRadius: 8 * fem,
              //             ),
              //           ],
              //         ),
              //         child: Container(
              //           margin: EdgeInsets.fromLTRB(
              //               100 * fem, 100 * fem, 100 * fem, 100 * fem),
              //           child: Image.asset(
              //             'assets/images/cube.png',
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                width: 400 * fem,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  const Tutorial(
                                idTutorial: "eletricidade", codigoText: false,
                              )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50 * fem),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x82615b69),
                            offset: Offset(0 * fem, 7 * fem),
                            blurRadius: 8 * fem,
                          ),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            100 * fem, 100 * fem, 100 * fem, 100 * fem),
                        child: Image.asset(
                          'assets/images/eletricidade.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 400 * fem,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Tutorial(
                                idTutorial: "cabos", codigoText: false,
                              )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50 * fem),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x82615b69),
                            offset: Offset(0 * fem, 7 * fem),
                            blurRadius: 8 * fem,
                          ),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            100 * fem, 100 * fem, 100 * fem, 100 * fem),
                        child: Image.asset(
                          'assets/images/cabos.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _componentes(double fem, double ffem) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(50 * fem, 100 * fem, 0 * fem, 0 * fem),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Componentes',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 54 * ffem,
                fontWeight: FontWeight.w600,
                height: 1.5 * ffem / fem,
                fontStyle: FontStyle.italic,
                color: const Color(0xff000000),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(25 * fem, 0 * fem, 0 * fem, 0 * fem),
          height: 400 * fem,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
               SizedBox(
                width: 400 * fem,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50 * fem),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x82615b69),
                            offset: Offset(0 * fem, 7 * fem),
                            blurRadius: 8 * fem,
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Tutorial(
                                    idTutorial: "arduino", codigoText: true,
                                  )));
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              100 * fem, 100 * fem, 100 * fem, 100 * fem),
                          child: Image.asset(
                            'assets/images/arduino.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 400 * fem,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50 * fem),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x82615b69),
                            offset: Offset(0 * fem, 7 * fem),
                            blurRadius: 8 * fem,
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Tutorial(
                                    idTutorial: "resistor", codigoText: false,
                                  )));
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              100 * fem, 100 * fem, 100 * fem, 100 * fem),
                          child: Image.asset(
                            'assets/images/resistor.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 400 * fem,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Tutorial(
                                idTutorial: "led", codigoText: true,
                              )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50 * fem),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x82615b69),
                            offset: Offset(0 * fem, 7 * fem),
                            blurRadius: 8 * fem,
                          ),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            100 * fem, 100 * fem, 100 * fem, 100 * fem),
                        child: Image.asset(
                          'assets/images/led.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 400 * fem,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Tutorial(
                                idTutorial: "buzzer", codigoText: true,
                              )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50 * fem),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x82615b69),
                            offset: Offset(0 * fem, 7 * fem),
                            blurRadius: 8 * fem,
                          ),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            100 * fem, 100 * fem, 100 * fem, 100 * fem),
                        child: Image.asset(
                          'assets/images/buzzer.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   width: 400 * fem,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: InkWell(
              //       onTap: () {
              //         Navigator.of(context).push(MaterialPageRoute(
              //             builder: (context) => const Tutorial(
              //                   idTutorial: "arduino",
              //                 )));
              //       },
              //       child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(50 * fem),
              //           color: const Color(0xffffffff),
              //           boxShadow: [
              //             BoxShadow(
              //               color: const Color(0x82615b69),
              //               offset: Offset(0 * fem, 7 * fem),
              //               blurRadius: 8 * fem,
              //             ),
              //           ],
              //         ),
              //         child: Container(
              //           margin: EdgeInsets.fromLTRB(
              //               100 * fem, 100 * fem, 100 * fem, 100 * fem),
              //           child: Image.asset(
              //             'assets/images/arduino.png',
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  _codigo(double fem, double ffem) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(50 * fem, 100 * fem, 0 * fem, 0 * fem),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Código',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 54 * ffem,
                fontWeight: FontWeight.w600,
                height: 1.5 * ffem / fem,
                fontStyle: FontStyle.italic,
                color: const Color(0xff000000),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(25 * fem, 0 * fem, 0 * fem, 0 * fem),
          height: 400 * fem,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 400 * fem,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  CodigoHome(text: Codigos().text1)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50 * fem),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x82615b69),
                            offset: Offset(0 * fem, 7 * fem),
                            blurRadius: 8 * fem,
                          ),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            100 * fem, 100 * fem, 100 * fem, 100 * fem),
                        child: Image.asset(
                          'assets/images/text.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 400 * fem,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  CodigoHome(text: Codigos().text2)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50 * fem),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x82615b69),
                            offset: Offset(0 * fem, 7 * fem),
                            blurRadius: 8 * fem,
                          ),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            100 * fem, 100 * fem, 100 * fem, 100 * fem),
                        child: Image.asset(
                          'assets/images/text.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 400 * fem,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  CodigoHome(text: Codigos().text3)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50 * fem),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x82615b69),
                            offset: Offset(0 * fem, 7 * fem),
                            blurRadius: 8 * fem,
                          ),
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            100 * fem, 100 * fem, 100 * fem, 100 * fem),
                        child: Image.asset(
                          'assets/images/text.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _button(double fem, double ffem) {
        //if (snapshot.data == true) {
        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 100 * fem, 0 * fem, 0 * fem),
            child: SizedBox(
              width: 200 * fem,
              height: 200 * fem,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //testar se dá certo ou primary color
                  backgroundColor: const Color(0xffe51f43),
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BXModelo()));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffe51f43),
                  ),
                  child: Image.asset(
                    'assets/images/camera.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ]);
  }
}
