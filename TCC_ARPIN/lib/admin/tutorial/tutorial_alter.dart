import 'package:ar_pin/admin/quests/quest_add.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../home_page.dart';
import '../../user_profile.dart';
import '../md/md_alter.dart';

class TutoAlter extends StatefulWidget {
  const TutoAlter({super.key});

  @override
  State<TutoAlter> createState() => _TutoAlterState();
}

class _TutoAlterState extends State<TutoAlter> {
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

          return ListView(
            children:[
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 50 * fem, 0 * fem, 25 * fem),
                  child: Text(
                    'Alterar Tutorial',
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
                _icon(fem, ffem),
                _text(fem, ffem),
                _button_edit(fem, ffem),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: _button(fem, ffem),
                )),
              ],
            );
        },
      ),
    );
  }

  _icon(double fem, double ffem) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(50 * fem, 0 * fem, 0 * fem, 0 * fem),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Icone:',
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
                child: Container(
                  margin: EdgeInsets.fromLTRB(100 * fem, 100 * fem, 100 * fem, 100 * fem),
                  child: Image.asset(
                    'assets/images/led.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _text(double fem, double ffem) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(50 * fem, 0 * fem, 0 * fem, 0 * fem),
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
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
          constraints: BoxConstraints(
            maxWidth: 850 * fem,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'LED',
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
        Container(
          margin: EdgeInsets.fromLTRB(50 * fem, 0 * fem, 0 * fem, 0 * fem),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Descrição:',
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
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 100 * fem),
          constraints: BoxConstraints(
            maxWidth: 850 * fem,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Aprenda a controlar LEDs com facilidade neste tutorial Arduino. Desde o básico até conceitos avançados, você vai dominar o uso de LEDs como componentes de saída. Ilumine seu caminho para o sucesso com Arduino!',
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
      ],
    );
  }

  _button_edit(double fem, double ffem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 35 * fem),
          width: 919 * fem,
          height: 125 * fem,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffe51f43),
              minimumSize: Size(919 * fem, 125 * fem),
              elevation: 0,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MDAlter()));
            },
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Material Didatico',
                      style: GoogleFonts.poppins(
                        fontSize: 48 * ffem,
                        fontWeight: FontWeight.w300,
                        height: 1.5 * ffem / fem,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(iconSize: 60, onPressed: () {}, icon: Image.asset('assets/images/white_bin.png')),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 50 * fem),
          width: 919 * fem,
          height: 125 * fem,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffe51f43),
              minimumSize: Size(919 * fem, 125 * fem),
              elevation: 0,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const QuestAdd()));
            },
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Questionario',
                      style: GoogleFonts.poppins(
                        fontSize: 48 * ffem,
                        fontWeight: FontWeight.w300,
                        height: 1.5 * ffem / fem,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(iconSize: 60, onPressed: () {}, icon: Image.asset('assets/images/white_bin.png')),
                ),
              ],
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
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
          child: Align(
            child: SizedBox(
              width: 1040 * fem,
              height: 1 * fem,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0 * fem, 50 * fem, 0 * fem, 35 * fem),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffe51f43),
              minimumSize: Size(919 * fem, 125 * fem),
              elevation: 0,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: Text(
              'Salvar Alterações',
              style: GoogleFonts.poppins(
                fontSize: 48 * ffem,
                fontWeight: FontWeight.w300,
                height: 1.5 * ffem / fem,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: const Color(0xffe51f43),
              side: const BorderSide(color: Color(0xffe51f43), width: 1),
              minimumSize: Size(919 * fem, 125 * fem),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            onPressed: () {},
            child: Text(
              'Desativar Tutorial',
              style: GoogleFonts.poppins(
                fontSize: 48 * ffem,
                fontWeight: FontWeight.w300,
                height: 1.5 * ffem / fem,
                color: const Color(0xffe51f43),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
