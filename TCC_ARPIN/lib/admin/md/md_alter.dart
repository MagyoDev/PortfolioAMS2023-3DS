import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../home_page.dart';
import '../../user_profile.dart';

class MDAlter extends StatefulWidget {
  const MDAlter({super.key});

  @override
  State<MDAlter> createState() => _MDAlterState();
}

class _MDAlterState extends State<MDAlter> {
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfile()));
              },
              icon: Image.asset('assets/images/user.png')),
        ],
        title: IconButton(
            iconSize: 40,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
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

          return Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 50 * fem, 0 * fem, 25 * fem),
                child: Text(
                  'Texto 1',
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
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 25 * fem),
                child: _titulo(fem, ffem),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 25 * fem),
                child: _conteudo(fem, ffem),
              ),
              _button(fem, ffem),
            ],
          );
        },
      ),
    );
  }

  _titulo(double fem, double ffem) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(50 * fem, 0 * fem, 0 * fem, 25 * fem),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Titulo:',
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
          constraints: BoxConstraints(
            maxWidth: 850 * fem,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '1 - O que é um Arduíno?',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 52 * ffem,
                fontWeight: FontWeight.w300,
                height: 1.5 * ffem / fem,
                fontStyle: FontStyle.italic,
                color: const Color(0xff000000),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _conteudo(double fem, double ffem) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(50 * fem, 0 * fem, 0 * fem, 25 * fem),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Conteudo:',
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
        SizedBox(
          child: SizedBox(
            width: 900 * fem,
            height: 1350 * fem,
            child: SingleChildScrollView(
              child: Text(
                'Arduino é uma plataforma de prototipagem eletrônica de código aberto que combina hardware e software. É composto por uma placa de desenvolvimento que possui um microcontrolador e uma interface de programação, permitindo que os usuários criem e controlem dispositivos interativos.\nA placa Arduino possui pinos de entrada e saída que podem ser conectados a uma variedade de componentes eletrônicos, como sensores, LEDs, motores e outros dispositivos. Esses componentes podem ser programados usando a linguagem de programação Arduino, que é baseada em C/C++ simplificado.\nO objetivo do Arduino é facilitar o processo de criação de projetos eletrônicos para pessoas sem um amplo conhecimento técnico. Com uma comunidade ativa e recursos online, é possível encontrar uma ampla gama de projetos, tutoriais e bibliotecas prontas para uso, facilitando o desenvolvimento de ideias criativas e inovadoras. O Arduino é amplamente utilizado em áreas como robótica, automação residencial, arte interativa, educação e muitos outros campos.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 52 * ffem,
                  fontWeight: FontWeight.w300,
                  height: 1.5 * ffem / fem,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xff000000),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _button(double fem, double ffem) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0 * fem, 50 * fem, 0 * fem, 35 * fem),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffe51f43),
              minimumSize: Size(919 * fem, 125 * fem),
              elevation: 0,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            onPressed: () {},
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
    );
  }
}
