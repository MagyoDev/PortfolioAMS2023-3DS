import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';
import 'user_profile.dart';

class BXModelo extends StatelessWidget {
  
  //testar se influencia ou não a aplicação
  const BXModelo({super.key});

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
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double baseWidth = 1040;
          double fem = constraints.maxWidth / baseWidth;
          double ffem = fem * 0.97;

          //voltar para o layout original(container?)
          return SizedBox(
            width: double.infinity,
            child: Container(
              // visualizarprojetocqD (255:42)
              padding: EdgeInsets.fromLTRB(0 * fem, 50 * fem, 0 * fem, 0 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Center(
                      child: Text(
                        'Circuitos e muito mais!',
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
                  SizedBox(
                    child: Center(
                      child: Text(
                        'Baixe nosso aplicativo de realidade aumentada e veja os circuitos em 3D!',
                        style: GoogleFonts.poppins(
                          fontSize: 52 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    // autogroupphqkkrs (4s1geN5pyBPZdEGAwYPhQK)
                    padding: EdgeInsets.fromLTRB(
                        198 * fem, 151 * fem, 173 * fem, 152 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // image1fyq (255:58)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 25 * fem, 250 * fem),
                          width: 644 * fem,
                          height: 596 * fem,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/image-1-bg.png',
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrl(
                                Uri.parse(
                                    "https://arpin-apk.vercel.app/apk/ARPIN.apk"),
                                mode: LaunchMode.inAppBrowserView);
                          },
                          child: Container(
                            // frame10P99 (255:72)
                            margin: EdgeInsets.fromLTRB(
                                28 * fem, 0 * fem, 23 * fem, 0 * fem),
                            padding: EdgeInsets.fromLTRB(
                                34.5 * fem, 27 * fem, 46 * fem, 27 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xffe51f43),
                              borderRadius: BorderRadius.circular(50 * fem),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Baixar Modelo RA',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 40 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5 * ffem / fem,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                  const Spacer(),
                                  //container ou sizedbox?
                                  SizedBox(
                                    // download11MkB (440:3)
                                    width: 60 * fem,
                                    height: 60 * fem,
                                    child: Image.asset(
                                      'assets/images/download-1-1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
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
          );
        },
      ),
    );
  }
}
