import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';
import 'user_profile.dart';

class ModelDisp extends StatelessWidget {
  const ModelDisp({super.key});

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

          return SizedBox(
            width: double.infinity,
            child: Container(
              // modelosra9V1 (440:11)
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    // autogroup9jdyfy9 (4s1a6Yzgxfzi4dnRGP9jdy)
                    width: double.infinity,

                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle141n7 (440:30)
                          child: Align(
                            child: SizedBox(
                              width: 1040 * fem,
                              height: 150 * fem,
                              child: Container(),
                            ),
                          ),
                        ),
                        Positioned(
                          // modelosradisponveisiTZ (440:46)
                          left: 131.5 * fem,
                          top: 50 * fem,

                          child: Align(
                            child: SizedBox(
                              width: 777 * fem,
                              height: 96 * fem,
                              child: Text(
                                'Modelos RA Disponíveis',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 64 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5 * ffem / fem,
                                  fontStyle: FontStyle.italic,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupxlns6yu (4s1aRTcrNqefkMMyptxLNs)
                    padding: EdgeInsets.fromLTRB(38 * fem, 0 * fem, 20 * fem, 0 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group2RWP (440:12)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 50 * fem),
                          height: 350 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle7vCF (440:42)
                                left: 76 * fem,
                                top: 39 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 889 * fem,
                                    height: 273 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(51 * fem),
                                        color: const Color(0x7fd9d1e4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // rectangle4cas (440:13)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 350 * fem,
                                    height: 350 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50 * fem),
                                        gradient: const LinearGradient(
                                          begin: Alignment(0, -1),
                                          end: Alignment(0, 1),
                                          colors: <Color>[Color(0xffffffff)],
                                          stops: <double>[1],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0x82615b69),
                                            offset: Offset(0 * fem, 7 * fem),
                                            blurRadius: 8 * fem,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // ledsimplesrEK (440:14)
                                left: 364 * fem,
                                top: 139 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 300 * fem,
                                    height: 72 * fem,
                                    child: Text(
                                      'LED Simples ',
                                      style: GoogleFonts.poppins(
                                        fontSize: 48 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5 * ffem / fem,
                                        fontStyle: FontStyle.italic,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // led3x2T (440:15)
                                left: 119 * fem,
                                top: 113 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 125 * fem,
                                    height: 125 * fem,
                                    child: Image.asset(
                                      'assets/images/led.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // bin1575 (440:40)
                                left: 870 * fem,
                                top: 145 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 60 * fem,
                                    height: 60 * fem,
                                    child: Image.asset(
                                      'assets/images/bin.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // playbutton11AuD (440:44)
                                left: 751 * fem,
                                top: 145 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 60 * fem,
                                    height: 60 * fem,
                                    child: Image.asset(
                                      'assets/images/play.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          // group3t4X (440:47)
                          width: double.infinity,
                          height: 350 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle7bjd (440:48)
                                left: 76 * fem,
                                top: 39 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 889 * fem,
                                    height: 273 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(51 * fem),
                                        color: const Color(0x7fd9d1e4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // rectangle4Jtw (440:49)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 350 * fem,
                                    height: 350 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50 * fem),
                                        gradient: const LinearGradient(
                                          begin: Alignment(0, -1),
                                          end: Alignment(0, 1),
                                          colors: <Color>[Color(0xffffffff)],
                                          stops: <double>[1],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0x82615b69),
                                            offset: Offset(0 * fem, 7 * fem),
                                            blurRadius: 8 * fem,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // buzzerxCo (440:50)
                                left: 364 * fem,
                                top: 139 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 158 * fem,
                                    height: 72 * fem,
                                    child: Text(
                                      'Buzzer',
                                      style: GoogleFonts.poppins(
                                        fontSize: 48 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5 * ffem / fem,
                                        fontStyle: FontStyle.italic,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // bin23k3 (440:52)
                                left: 870 * fem,
                                top: 145 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 60 * fem,
                                    height: 60 * fem,
                                    child: Image.asset(
                                      'assets/images/bin.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // playbutton12ZiP (440:53)
                                left: 751 * fem,
                                top: 145 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 60 * fem,
                                    height: 60 * fem,
                                    child: Image.asset(
                                      'assets/images/play.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // sensorpiezo2sj5 (440:54)
                                left: 119 * fem,
                                top: 113 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 125 * fem,
                                    height: 125 * fem,
                                    child: Image.asset(
                                      'assets/images/buzzer.png',
                                      fit: BoxFit.cover,
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
            ),
          );
        },
      ),
    );
  }
}
