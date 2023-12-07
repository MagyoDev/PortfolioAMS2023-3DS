import 'package:ar_pin/admin/quests/quest_alter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../home_page.dart';
import '../../user_profile.dart';



class QuestAdd extends StatefulWidget {
  const QuestAdd({super.key});

  @override
  State<QuestAdd> createState() => _QuestAddState();
}

class _QuestAddState extends State<QuestAdd> {
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
                  'Questões',
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
              _question(fem, ffem),
              _button(fem, ffem),
            ],
          );
        },
      ),
    );
  }

  _question(double fem, double ffem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 35 * fem),
          width: 919 * fem,
          height: 100 * fem,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0x50DAD1E4),
              minimumSize: Size(919 * fem, 125 * fem),
              elevation: 0,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
            onPressed: () {},
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
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(iconSize: 0, onPressed: () {}, icon: Image.asset('assets/images/bin.png')),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _button(double fem, double ffem) {
    return Expanded(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 50 * fem, 0 * fem, 35 * fem),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffe51f43),
                  minimumSize: Size(919 * fem, 125 * fem),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const QuestAlter()));
                },
                child: Text(
                  'Adicionar Pergunta',
                  style: GoogleFonts.poppins(
                    fontSize: 48 * ffem,
                    fontWeight: FontWeight.w300,
                    height: 1.5 * ffem / fem,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
